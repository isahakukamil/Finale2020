#!/bin/bash
Security-Control(){
#---MOP WORK PACKAGE TAG: WP052V3---
#---DESC:
#THIS SCRIPT PROVIDES SCREENSHOT FOR SECURITY CONTROL VALIDATION---

#---SCRIPT BY REUBEN A BOAKYE
#SIGNUM: EBOAREU---

#---PRINT PRESENT WORKING DIRECTORY---
pwd 

#---CHECK IF GNOME-SCREENSHOT PACKAGE IS INSTALLED---
#---THIS IS PACKAGE NEEDED FOR THE SCREENSHOT TO BE TAKEN---
filename="gnome-screenshot" 
if rpm -qa | grep -i $filename
then
	echo "`tput bold`Package is already installed"
else 
	echo "`tput bold`Package not installed. Proceeding to install..."	
	sudo yum -y install $filename
fi    

#---/VAR/LOG FILES---

ls -l /var/log/secure
ls -l /var/log/audit/audit.log
ls -l /var/log/messages
ls -l /var/log/lastlog
ls -l /var/run/faillock

echo "Please enter file name"
read name
imgExtension=".png"
imgName=$name$imgExtension
#imgDirectory="/Pictures/"
#imgSavePath=$imgDirectory$imgName
gnome-screenshot -w --file="$imgName"

#---CAT AND MORE---

cat /etc/ssh/sshd_config | grep -i PermitRootLogin
crontab -l
more /etc/issue
more /etc/motd
more /etc/ftpd/banner.msg
cat /etc/sudoers
cat /etc/group
cat /etc/passwd

echo "Please enter new file name"
read name
imgExtension=".png"
imgName=$name$imgExtension
#imgDirectory="/Pictures/"
#imgSavePath=$imgDirectory$imgName
gnome-screenshot -w --file="$imgName"


  
#BELOW IS FOR USE IF TIMESTAMP HAS TO BE IMPLEMENTED AS FILENAME.
#currentDate=$(date '+%m_%y_%H_%M_%S')
. rollback.sh
roll
}
Security-Control
