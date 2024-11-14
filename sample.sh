#!/bin/bash
date=$(date +%F:%H:%M:%S)
script_name=$0
logfile=/tmp/$script_name-$date.log
validate(){
    if [ $? -ne 0 ]
    then
        echo "$2 failed..."
        exit 1
    else
        echo "$2 successful..."
    fi
}
USERID=$(id -u)
if [$USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with sudo permissions"
    exit 1
fi

yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y &>>$LOGFILE
validate $? "Installing MySql"

yum install postfix -y &>>$LOGFILE
validate $? "Installing postfix"
