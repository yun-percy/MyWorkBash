#!/bin/bash
#此脚本使用在Android 各项处理上
#制作者：振云
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH

adb start-server
TIMES=0
cs
if [[ $? == 4 ]]; then
	result=$(fastboot reboot 2>&1)
	echo -e "\033[36mGo To Main system| 即将重启到正常系统\033[0m"
	status=`echo $result|awk -F : '{print $1}'`
	while [[ "$status" == "error" ]]; do
		echo -e "\033[31m$result\033[0m"
		echo -e "\033[33m$TIMES: we will try in 3 seconds....\033[0m"
		sleep 2
		((TIMES++))
		result=$(fastboot reboot 2>&1)
		status=`echo $result|awk -F : '{print $1}'`
	done
else
result=$(adb reboot 2>&1)
echo -e "\033[36mGo To Main system| 即将重启到正常系统\033[0m"
status=`echo $result|awk -F : '{print $1}'`
while [[ "$status" == "error" ]]; do
	echo -e "\033[31m$result\033[0m"
	echo -e "\033[33m$TIMES: we will try in 3 seconds....\033[0m"
	sleep 2
	((TIMES++))
	result=$(adb reboot 2>&1)
	status=`echo $result|awk -F : '{print $1}'`
done
fi
echo -e "\033[32mDone!\033[0m"
