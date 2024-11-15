#!/bin/bash
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R=\e[31m
G=\e[32m
N=\e[0m
CHECK(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 $R....failed $N"
        exit 1
    else
        echo -e "$2 $G....Successful $N"
    fi
}

user=$(id -u)
if [ $user -ne 0 ]
then
    echo -e " $R ERROR:: Please run the script with sudo permissions $N"
    exit 1
fi
for i in $@
do 
    yum install $i -y
    CHECK $? $1 $2
done