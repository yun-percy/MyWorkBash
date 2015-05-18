#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH
# set -x
SU="su -c"

get_block(){
	path=$(adb shell $SU "ls -al dev/block/platform/*/by-name"| grep system)
	path=`echo $path | awk '{print $NF}'`
	echo -n "The system block is: "
	echo -e "\033[32m$path\033[0m"
}
mount_block(){
	mount_result=$(adb shell $SU "mount -o remount,rw $path /system")
	echo -n "mount system block "
	if [[ $mount_result == "" ]]; then
		echo -e "\033[32mSuccessful!\033[0m"
	else
		echo -e "\033[31mFailed!\033[0m"
		echo "error : $mount_result"
	fi
}
cs
mode=$?
if [[ $mode == 2 ]]; then
	SU="su -c"
	get_block
	mount_block
elif [[ $mode == 3 ]]; then
	mount_result=$(adb shell "mount -a")
	echo -n "mount system block "
	if [[ $mount_result == "" ]]; then
		echo -e "\033[32mSuccessful!\033[0m"
	else
		echo -e "\033[31mFailed!\033[0m"
		echo "error : $mount_result"
	fi
else
	echo -e "\033[33mPlease Go To Recovery Mode Or Normal Mode\033[0m"
fi


