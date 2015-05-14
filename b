#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# set -x
PROJECT=$1
DATE=`date "+%Y-%m-%d-%H_%M_%S" `
DATE_INFO=`date "+%Y年%m月%d日%H时%M分 周%w" `
LOACAL_PATH=`pwd`
OUT_PATH="$LOACAL_PATH/out"
TOOLPATH=~/yun
SIGNAPKJAR=$TOOLPATH/signapk.jar
KEY="testkey"
KEY_PEM=$TOOLPATH/$KEY.x509.pem
KEY_PK8=$TOOLPATH/$KEY.pk8
# echo $filepath
clear
BACKUP(){
	backup=0
	if [ -f "$OUT_PATH/$PROJECT.apk" ]; then
	 mv $OUT_PATH/$PROJECT.apk $OUT_PATH/${PROJECT}$DATE.apk 2>/dev/null
	 ((backup++))
	fi
	if [ -f "$OUT_PATH/${LOACAL_PATH}_decode.apk" ]; then
	 	mv $OUT_PATH/${LOACAL_PATH}_decode.apk $OUT_PATH/${LOACAL_PATH}${DATE}_decode 2>/dev/null
	((backup++))
	fi
	# echo $backup
	if [[ $backup != 0 ]]; then
		echo -e "\033[32mbackup successd!\033[0m"
	else
		echo "No need back up"
	fi
}
BUILD(){
	echo -e "\033[36mbuilding $PROJECT .......\033[0m"
	set -e
	~/yun/apktool b $LOACAL_PATH/$PROJECT -o $OUT_PATH/${PROJECT}_decode.apk
	
	echo -e "\033[32mbuild $PROJECT.apk compeleted\033[0m"
}
SIGN(){
	echo -e "\033[36msigning $PROJECT.apk .....\033[0m"
	 java -jar $SIGNAPKJAR $KEY_PEM $KEY_PK8 $OUT_PATH/${PROJECT}_decode.apk $OUT_PATH/${PROJECT}.apk
	 echo -e "\033[32msign $PROJECT.apk compeleted\033[0m"
}
DLETED_ORIGIN_FILES(){
	if [ -d "$PROJECT/build" ] && [ -d "$PROJECT/original" ]; then
		echo "Do you  want delete $PROJECT/original and $PROJECT/build?"
		read -n 1 -p "(\"y\"to delete,other key to skip):  " delete_orign_files
	if [[ $delete_orign_files == "y" ]]; then
		if [ ! -d "$PROJECT/build" ]; then
	  		echo "skip rm build...."
		else 
			rm -r $PROJECT/build 2> /dev/null
		fi
		if [ ! -d "$PROJECT/original" ]; then
	  		echo "skip rm original"
		else 
			rm -r $PROJECT/original 2> /dev/null
		fi
	fi
fi
}

echo ''
echo '====================================================='
echo 'Android Apktools build command with apktool200rc4.jar'
echo 'Android 反编译打包指令，打包版本为: apktool200rc4.jar'
echo "打包时间为： $DATE_INFO "
echo
echo

mkdir $OUT_PATH 2>/dev/null
if [[ $? == 1 ]]; then
	echo -en "\033[33mcan't mkdir $OUT_PATH:  \033[0m"
	if [ -d "$OUT_PATH" ]; then
	  echo -e "\033[32mfolder exist... skiping....\033[0m"
	  BACKUP
	 else 
	 	echo -e "\033[31mpermission denied or other error\033[0m"
	 	exit
	fi
else
	echo "mkdir out successd"
fi
if [ ! -d "$LOACAL_PATH/$PROJECT" ]; then

	if [ -f "$LOACAL_PATH/$PROJECT" ]; then
 		echo "this shell script is build folder to apk,Are you means: "
 		echo "(这个脚本是用来将文件夹打包成apk，你的意思是不是打包：  )"
 		PROJECT_APK=`echo $PROJECT|awk -F . '{print $1}'`
 		echo -e "\033[36m$PROJECT_APK\033[0m"
 		echo "(press any key to cancle, input \"y\" confirm)按任意键取消，y确认:  "
 		read yes
 		if [[ "$yes" != "y" ]]; then
 			exit
 		fi
 		PROJECT=$PROJECT_APK
 	else
 		echo -e "\033[31mNo $PROJECT found! please check your input \033[0m"
 		exit
	fi
else 
	echo -e "\033[32mfind $PROJECT folder,pareing to build ....\033[0m"
fi
BUILD
SIGN
DLETED_ORIGIN_FILES
echo -e "\033[32mDone!\033[0m"	
