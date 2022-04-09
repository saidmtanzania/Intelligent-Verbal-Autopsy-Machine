import re
from flask import Flask, request, url_for, redirect, render_template
import pickle
from flask_mysqldb import MySQL
import numpy as np
from numpy.lib.function_base import insert
import pandas as pd
import pymysql
from sqlalchemy import create_engine


va_web=Flask(__name__)

sqlEngine       = create_engine('mysql+pymysql://root:@127.0.0.1/verbal_autopsy', pool_recycle=3600)
dbConnection    = sqlEngine.connect()

# database configuration
va_web.config['MYSQL_HOST'] = 'localhost'
va_web.config['MYSQL_USER'] = 'root'
va_web.config['MYSQL_PASSWORD'] = ''
va_web.config['MYSQL_DB'] = 'verbal_autopsy'

mysql = MySQL(va_web)

model=pickle.load(open('../models/lgb_model.pkl', 'rb'))
data = pd.read_csv('../output/va_data.csv')




# maps of the coressponding value
marital_status_map={0:'Never Married', 1:'Married', 2:'Divorced', 3:'Separated', 4:'Widowed', 999:'Unknown'}
last_education_map={2:'High School', 1:'Primary School', 0:'No Schooling', 3:'College or Higher', 999:'Unknown'}
x_yes_no_map={1:'Yes', 0:'No', 9:"Don't Know", 8:'Refused to Answer'}
fever_severity_map = {9:"Don't Know", 2:'Moderate', 1:'Mild', 3:'Severe'}
alcohol_amount_map = {3:'High', 9:"Don't Know", 2:'Moderate', 1:'Low'}
respondent_relationship_map = {1:"Mother", 2:"Father", 3:"Grandmother", 4:"Grandfather", 5:"Aunt", 6:"Uncle", 7:"Husband", 8:"Wife",
          9:"Brother", 10:"Sister", 11:"Birth Attendant", 12:"Other Male", 13:"Other Female", 999:"Unknown"}
yes_no_map={1:'Yes', 0:'No', 9:"Don't Know"}
deceased_sex_map={0:'Male', 1:'Female'}
dont_know_map={999:"Don't Know"}



confidence=''
cod_label=''
user_name=''

@va_web.route('/')
def hello_world():
    return render_template("index.html")


@va_web.route('/signin', methods=['POST', 'GET'])
def signin():
    return render_template('signin.html')



@va_web.route('/signup', methods=['POST', 'GET'])
def signup():
    user_data=request.form

    n_username=user_data['n_username']
    n_email=user_data['n_email']
    n_pw=user_data['n_pw']
    n_pw2 = user_data['n_pw2']

    if(n_pw == n_pw2):
        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO interviewers(username, email, pword) VALUES(%s, %s, %s)", (n_username, n_email, n_pw))
        mysql.connection.commit()
        cursor.close()
        return render_template('signin.html')
    else:
        return render_template('signin.html')


@va_web.route('/all_interviews', methods=['POST', 'GET'])
def all_interviews():

    interviews_df = pd.read_sql('SELECT * FROM va_data', con=dbConnection)

    return render_template('all_interviews.html', tables=[interviews_df.to_html(index=False)], titles=interviews_df.columns.values)



@va_web.route('/home',  methods=['POST','GET'])
def home():
    user_data = request.form
    
    mail = "\"" + user_data['email'] + "\""

    curs = mysql.connection.cursor()
    res_val = curs.execute("SELECT username, email, pword FROM interviewers WHERE email =" + mail)

    if(res_val > 0):
        db_data = curs.fetchall()

        user_name, email, pw, = db_data[0]

        global user_mail;
        global user_namex;

        user_namex=user_name

        user_mail=email
        
        if(email == user_data['email'] and pw == user_data['pw']):
            return render_template('home.html', user=user_name)
        else:            
            return render_template('signin.html', err_msg='Username or password incorrect')


    elif(user_data['email']=='admin@ivam.com' and user_data['pw']=="0000"):
        interviewers_df = pd.read_sql('SELECT * FROM interviewers', con=dbConnection)

        # interviewers_df.email = interviewers_df.email.apply(lambda x: f'<a href="/user/{x}" title="View User">{x}</a>')
        interviewers_df.username = interviewers_df.apply(lambda x: f'<a href="/user/{x.email}" title="View User" > {x.username}', axis=1)
        # interviewers_df.pword = interviewers_df.pword.apply(lambda x: f'{x}</a>')

        interviews_df = pd.read_sql('SELECT * FROM va_data', con=dbConnection)

        intr_no=str(len(interviewers_df.email.unique()))
        intv_no=str(interviews_df.shape[0])

        return render_template('admin.html', interviewers_no=intr_no, interviews_no=intv_no, 
                                             tables=[interviewers_df.to_html(index=False, escape=False)], titles=interviewers_df.columns.values)

    else:
        return render_template('signin.html', err_msg='Username or password incorrect')



# #####        #########################################################################################
# #####     ############################################################################################
# ##### ################################################################################################
# ##### ################################################################################################

@va_web.route('/user/<identifier>')
def user(identifier):

    user_interviews = pd.read_sql('SELECT * FROM va_data WHERE email=' + "'"+ identifier + "'", con=dbConnection)
    
    mail = "\"" + identifier + "\""
    curs = mysql.connection.cursor()
    res_val = curs.execute("SELECT username FROM interviewers WHERE email =" + mail)
    db_data = curs.fetchall()
    name=db_data[0]
    name=name[0]

    return render_template('user_profile.html',
                            tables=[user_interviews.to_html(index=False)],
                            titles=user_interviews.columns.values,
                            username= name,
                            email= identifier,
                            no_intrv= user_interviews.shape[0],
                            )




@va_web.route('/interviews_user', methods=['POST', 'GET'])
def interviews_user():

    df = pd.read_sql('SELECT * FROM va_data WHERE email=' + "'"+ user_mail + "'", con=dbConnection)
    return render_template('interviews_user.html', user=user_namex, tables=[df.to_html(index=False)], titles=df.columns.values)


@va_web.route('/interview', methods=['POST', 'GET'])
def interview():

    return render_template('interview.html')





@va_web.route('/predict', methods=['POST','GET'])
def predict():
    features=[x for x in request.form.values()]
    numbers = [float(y) for y in features[:49]]
    X=[np.array(numbers)] 
    nums = np.array(numbers)

    prediction = model.predict(X)
    probs = model.predict_proba(nums.reshape(1, -1))
    p = np.max(probs.tolist())

    # Get the probabilities of the firts five Classes Predicted
    prediction_dict={}
    i=0

    probs=probs[0].tolist()

    for label in model.classes_:
        prediction_dict[label]=probs[i]
        i=i+1

    sorted_classes = sorted(prediction_dict.items(), key=lambda x: x[1], reverse=True)
    first = str(np.round(sorted_classes[0][1] * 100, 3)) + '%' + ' - ' + sorted_classes[0][0]
    second = str(np.round(sorted_classes[1][1] * 100, 3)) + '%' + ' - ' + sorted_classes[1][0]
    third = str(np.round(sorted_classes[2][1] * 100, 3)) + '%' + ' - ' + sorted_classes[2][0]
    forth = str(np.round(sorted_classes[3][1] * 100, 3)) + '%' + ' - ' + sorted_classes[3][0]
    fifth = str(np.round(sorted_classes[4][1] * 100, 3)) + '%' + ' - ' + sorted_classes[4][0]


    p = p * 100
    p=np.round(p, 3)
    confidence = str(p) + '%'
    cod_label=prediction[0]

    global new_row;

    numbers.append(cod_label)

    numbers.append(p)

    new_row=numbers.copy()

    return render_template('submit.html', pred=cod_label, proba=confidence, p1=first, p2=second, p3=third, p4=forth, p5=fifth)


@va_web.route('/submit',  methods=['POST','GET'])

def submit():
    idx=len(data)

    extra_info=[a for a in request.form.values()]
    extra_info=extra_info[:4]
    
    for val in extra_info:
        new_row.append(val)
    
    new_row.append(user_mail)

    data.loc[idx] = new_row



    data.marital_status=data.marital_status.replace(marital_status_map)
    data.last_education=data.last_education.replace(last_education_map)
    data.deceased_sex=data.deceased_sex.replace(deceased_sex_map)
    data.fever_severity=data.fever_severity.replace(fever_severity_map)
    data.alcohol_amount=data.alcohol_amount.replace(alcohol_amount_map)
    data.respondent_relationship=data.respondent_relationship.replace(respondent_relationship_map)
    data.respondent_sex=data.respondent_sex.replace(deceased_sex_map)

    for col in data.columns.tolist():
        vals=data[col].unique().tolist()

        if(8 in vals):
            data[col]=data[col].replace(x_yes_no_map)
        elif(1 or 0 or 9 in vals):
            data[col]=data[col].replace(yes_no_map)
        elif(999 in vals):
            data[col]=data[col].replace(dont_know_map)



    data.to_csv('../output/va_data.csv', index=False)

    data.to_sql('va_data', con=dbConnection, if_exists='replace')

    return render_template('home.html', user=user_namex)


if __name__ == '__main__':
    va_web.run(debug=True)
