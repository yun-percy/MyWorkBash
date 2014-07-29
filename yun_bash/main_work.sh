#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

reset 
for (( i = 0; i < 10; i++ )); do
	#statements

echo
echo ===========================欢迎使用Linux下一键编译工具======================
echo
echo 请选择今天的工作内容：
echo
echo 1:  framework-res
echo 2:  Contacts
echo 3:  Phone                               
echo 4:  Mms
echo 5:  Deskclock
echo 6:  SystemUI
echo 7:  Settings
echo 8:  Light
echo 9:  service.jar
echo 10: android.policy.jar
echo 11: ext.jar
echo 12: core.jar
echo 13: SoundRecorder
echo "14: 下一页(1/3)"

echo 00:源码	
echo
echo =========================================================================
echo
echo
read -p "请输入相关序号" number
echo
location=system/app
Resources_location=packages/apps/$project
case $number in
	"1" )
		project=framework-res
		location=system/framework
		Resources_location=frameworks/base/core/res
		;;
	"2" )
		project=Contacts	
		;;
	"3" )
		project=Phone	
		;;
	"4" )
		project=Mms	
		;;
	"5" )
		project=Deskclock
		;;
	6 ) project=SystemUI ;;	
	7 ) project=Settings ;;
	"00" )
		project=Resources
		break
		;;
esac
./yun_bash/main_function.sh $project $location $Resources_location 
done
