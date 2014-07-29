#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo $1 $2 $3
project=$1
location=$2
Resources_location=$3
DATE=`date "+%Y-%m-%d-%H_%M_%S" `
echo
echo 正在跳转至$project 工程页面......
echo
echo
echo  
clear
for (( i = 0; i < 100; i++ )); do
	echo 
	echo ============================您现在位于$project处理界面=====================
	echo
	echo 1:反编译
	echo 2:回编译 + 签名 + 推送     
	echo 3:推送到手机
	echo 4:搭建框架  
	echo 5:重启手机
	echo 6:编译源码的$project+签名+推送
	echo 7:签名 apk
	echo 8:分析刚刚源码编译生成的apk
	echo
	echo
	echo =========================================================================
	echo
	read -p "      请根据功能输入序号   " fuction
case $fuction in
	"1" )
		./yun_bash/decode.sh $project $DATE 
		;;
	"2" )
		./yun_bash/re_decode.sh $project $DATE $location
		;;
	"3" )
		./yun_bashpush.sh $project $location
		;;
	"4" )
		./yun_bash/if_frame.sh
		;;
	"5" )
		read -p "请选择模式: 1:刷机模式 2:bootloader(fastboot) 任意键:正常重启" mode
		./yun_bash/reboot.sh $mod
		;;
	"6")
		./yun_bash/mmm_make.sh $project $location $Resources_location $DATE
		;;
	"7" )
		./yun_bash/sign.sh $project $DATE
		./yun_bash/push.sh $project $location
		
		;;
	"8" )
		./yun_bash/analyse.sh $project $DATE $location
		;;
	"e")
		exit

	esac

done
done