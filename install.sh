#!/bin/bash
DATE=$(date +%F:%H:%M:%S)
SCRIPt_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
VALIDATE(){
    if [ $? -ne 0 ]
then
    echo "$2 failed..."
    exit 1
else
    echo "$2 successful..."
fi
}
userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "Error:: Please run this script with root access"
    exit 1
fi

yum update -y &>>$LOGFILE
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y &>>$LOGFILE
VALIDATE $? "Installing mysql"
yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing postfix"


 