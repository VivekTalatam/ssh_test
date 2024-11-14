#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "Error:: Please run this script with root access"
    exit 1
fi
yum update -y
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

if [ $? -ne 0 ]
then
    echo "Installation failed..."
else
    echo "Installation successful..."
fi
 