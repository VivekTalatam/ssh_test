#!/bin/bash
date=$(date +%F:%H:%M:%S)
script_name=$0
logfile=/tmp/$script_name-$date.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
validate(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 $R failed... $N"
        exit 1
    else
        echo -e "$2 $G successful... $N"
    fi
}
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR:: Please run this script with sudo permissions $N"
    exit 1
fi

yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y &>>$logfile
validate $? "Installing MySql"

yum install postfix -y &>>$logfile
validate $? "Installing postfix"
