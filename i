#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝
#写于2014年4月 深圳语信公司
#写于2014年6月 深圳语信公司
#写于2014年7月 深圳云雀公司
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH

project=$1
DATE=`date "+%Y-%m-%d-%H_%M_%S" `
filepath=`pwd`
echo $filepath
dump $project > yun.temp
# cat yun.temp
sed -i '/^$/d' yun.temp
sed -i '/^[[]]*$/d'  yun.temp
i=1
while read myline
do
	if [[ $i == "1" ]]; then
		echo "包名：$myline"
		packages=$myline
		i=2
	else
		if [[ $myline != "" ]]; then
			packagesname=$myline
			echo "主activity名:$myline"
		fi
	fi
done <  yun.temp
rm yun.temp
echo $packages
project=`echo $project | awk -F . '{print $1}'`

echo $project
adb install -r $filepath/$project.apk
adb shell am start -n $packages/$packagesname




# for (( i = 0; i < 100; i++ )); do
# 	adb install -r $filepath/$project.apk
# 	if [ "$project" == "launcher2" ]; then
# 		adb shell am start -n com.cooee.unilauncher/com.iLoong.launcher.desktop.iLoongLauncher
# 	elif [[ "$project" == "Settings" ]]; then
# 		adb shell am start -n com.android.settings/com.android.settings.MainActivity
# 	elif [[ "$project" == "Contacts" ]]; then
# 		adb shell am start -n com.android.contacts/com.android.contacts.activities.PeopleActivity
# 	elif [[ "$project" == "Dialer" ]]; then
# 		adb shell am start -n com.android.dialer/com.android.dialer.DialtactsActivity
# 	elif [[ "$project" == "QuickSearchBox" ]]; then
# 		adb shell am start -n com.android.quicksearchbox/com.android.quicksearchbox.SearchActivity
# 	elif [[ "$project" == "Mms" ]]; then
# 		adb shell am start -n com.android.mms/com.android.mms.ui.BootActivity
# 		adb shell am start -n com.android.mms/.ui.ConversationList
# 	fi

# 	read -p "退出请输入：e:    " ex

# 	if [[ "$ex" == "e" ]]; then
# 		break
# 	fi
# done
