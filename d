#!/bin/bash
#此脚本使用在Android 各项处理上
#制作者：振云
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH

PROJECT=$1
DATE=`date "+%Y-%m-%d-%H_%M_%S" `
DATE_INFO=`date "+%Y年%m月%d日%H时%M分 周%w" `
LOACAL_PATH=`pwd`
OUT_PATH="$LOACAL_PATH/out"
TOOLPATH=~/yun
DECODE_FOLDER=`echo $PROJECT| awk -F . '{print $1}'`
echo ''
echo '====================================================='
echo 'Android Apktools decode command with apktool200rc4.jar'
echo 'Android 反编译解包指令，打包版本为: apktool200rc4.jar'
echo "解包时间为： $DATE_INFO "
echo
echo

if [ ! -f "$PROJECT" ]; then
 	echo -e "\033[33mcan't find $PROJECT\033[0m"
fi
if [ -d "$PROJECT" ]; then
  echo -e "\033[33m we find a folder named as you input ,do you means decode $PROJECT.apk\033[0m"
  echo -n "input n/N to cancle decode $PROJECT.apk,any key to continue: "
  read -n 1 confirm_decode
  if  [ "$confirm_decode" == "n" ] || [ "$confirm_decode" == "N" ] ; then
  	exit
  fi
  mv $PROJECT ${PROJECT}${DATE}
  PROJECT=$PROJECT.apk
fi
if [ -d "$DECODE_FOLDER" ]; then
  echo -e "\033[33mwe find the decode folder.....it will move to ${DECODE_FOLDER}${DATE}\033[0m"
  mv $DECODE_FOLDER ${DECODE_FOLDER}${DATE}
  echo -e "\033[32mnow decode will go on\033[0m"
fi

	~/yun/apktool d ${LOACAL_PATH}/${PROJECT}
#echo $filename
echo -e "\033[32mDone!\033[0m"


