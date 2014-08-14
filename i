#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
DATE=`date "+%Y-%m-%d-%H_%M_%S" `
filepath=`pwd`
echo $filepath

for (( i = 0; i < 100; i++ )); do
	adb install -r $filepath/$project.apk
	if [ "$project" == "launcher2" ]; then

		adb shell am start -n com.cooee.unilauncher/com.iLoong.launcher.desktop.iLoongLauncher
	elif [[ "$project" == "Settings" ]]; then
		adb shell am start -n com.android.settings/com.android.settings.MainActivity
	elif [[ "$project" == "Contacts" ]]; then
		adb shell am start -n com.android.contacts/com.android.contacts.activities.PeopleActivity
	elif [[ "$project" == "Dialer" ]]; then
		adb shell am start -n com.android.dialer/com.android.dialer.DialtactsActivity
	elif [[ "$project" == "QuickSearchBox" ]]; then
		adb shell am start -n com.android.quicksearchbox/com.android.quicksearchbox.SearchActivity
		#statements
	fi

	read -p "退出请输入：e:    " ex
	
	if [[ "$ex" == "e" ]]; then
		break
	fi
done