#!/bin/bash
#此脚本使用在Android 各项处理上
#制作者：振云
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH
clear
PROJECT=$1
DATE=`date "+%Y-%m-%d-%H_%M_%S" `
DATE_INFO=`date "+%Y年%m月%d日%H时%M分 周%w" `
LOACAL_PATH=`pwd`
OUT_PATH="$LOACAL_PATH/out"
TOOLPATH=~/yun
DECODE_FOLDER=`echo $PROJECT| awk -F . '{print $1}'`
echo ''
echo '====================================================='
echo 'Android Apktools if  command with apktool200rc4.jar'
echo 'Android 反编译安装框架指令，jar版本为: apktool200rc4.jar'
echo "安装框架时间为： $DATE_INFO "
echo
echo
if [ ! -f "$PROJECT" ]; then
		apknumber=`ls -l *$PROJECT*.apk | grep "^-"|wc -l`
		echo -e "\033[33mcan't find a file named as $PROJECT,Searching.....\033[0m"
		if [ -d "$PROJECT" ] || [ -f "$PROJECT.apk" ]; then
		 	echo -e "\033[36mDo you means $PROJECT.apk ? (y/anykey)\033[0m"
			read -n 1 foldertoapk
			if [[ "$foldertoapk" == "y" ]]; then
				PROJECT=$PROJECT.apk
			else 
				exit
			fi
		
		elif [ $apknumber != 0 ] ; then
			echo -e "\033[36mDo you means: ? \033[0m"
			apklist=0
			apks=(`ls *$PROJECT*.apk`)
			echo ${apks[2]}
			for i in `ls *$PROJECT*.apk`
			do 
				echo "$apklist -> $i"
				((apklist++))
			done
			if [[ $apknumber == 1 ]]; then
				read -n 1 -p "y to confirm,anykey to exit: "
			else
				read -p "please choose the number: " chooseapk
				echo "you choose :${apks[${chooseapk}]}"
				PROJECT=${apks[${chooseapk}]}
			fi
		else
			echo -e "\033[33mNothing found please check your input\033[0m"
		fi
fi

$TOOLPATH/apktool if $LOACAL_PATH/$PROJECT
echo -e "\033[32mDone!\033[0m"
#echo $filename