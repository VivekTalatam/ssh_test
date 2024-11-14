#!/bin/bash
date=$(date +%F:%H:%M:%S)
script_name=$0
logfile=/tmp/$script_name-$date.log
validate(){
    if [ $? -ne 0 ]
    then
        echo -e "\e[31m $2 failed..."
        exit 1
    else
        echo -e "\e[32m $2 successful..."
    fi
}
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with sudo permissions"
    exit 1
fi

yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y &>>$logfile
validate $? "Installing MySql"

yum install postfix -y &>>$logfile
validate $? "Installing postfix"
