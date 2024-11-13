#!/bin/bash
echo "Enter Today's Day:- "
read TODAY
if [ $TODAY -eq "sunday" ] 
then
    echo "Yo, Let's Chill!"

else 
    echo "Let's get back to work :("
fi