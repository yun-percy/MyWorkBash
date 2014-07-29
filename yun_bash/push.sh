#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1 
location=$2
adb root

while [ $? = 1 ]; do  
	echo "======root failed, re-root again======"  
	sleep 3
	adb root
done
adb remount
while [ $? = 1 ]; do  
	echo "======remount failed, re-remount again======"  
	sleep 3
	adb remount  
done
echo pushing.....
adb push ./out/${project}.apk $location
echo 完成!
if [[ $project == "Phone" ]]; then
	echo 正在重启......
	adb reboot
fi