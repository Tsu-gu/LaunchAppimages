#!/bin/bash

user=$(whoami)
# The directory where you are storing the appimages
directory="/home/$user/Apps"
rm $directory/appimagelines.txt
cd $directory
ls $directory -R | grep ".AppImage" >> $directory/appimagelines.txt
# Counts the number of lines, therefore number of appimages
theapps=$(nl -w2 -s'--> ' appimagelines.txt)
echo -e "\e[0;39m---------------Available-Appimages-------------\e[0;39m"
echo -e "\e[1;32m$theapps\e[1;32m" 
echo -e "\e[0;39m-----------------------------------------------\e[0;39m"
read -p "Enter number of the app: " line
# Launches the selected app
app=$(head -n $line appimagelines.txt | tail -1)
./$app
