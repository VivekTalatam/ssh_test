#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "Error:: Please run this script with root access"
    exit 1
fi
VALIDATE(){
    if [ $? -ne 0 ]
then
    echo "Installation failed..."
    exit 1
else
    echo "Installation successful..."
fi
}
yum update -y
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
VALIDATE $? "Installing mysql..."
yum install postfix -y
VALIDATE $? "Installing postfix..."


 