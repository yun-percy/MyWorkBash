#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
DATE=$2 
location=$3

for (( i = 0; i < 100; i++ )); do
	ls
	mv ./out/${project}.apk ./out/${project}$DATE.apk
	mv ./out/${project}_decode.apk ./out/${project}${DATE}_decode
	./apktool b $project -o ./out/${project}_decode.apk
	while [ $? = 1 ]; do
	./apktool b $project ./out/${project}_decode.apk
	#statements
done
	java -jar signapk.jar testkey.x509.pem testkey.pk8 ./out/${project}_decode.apk ./out/${project}.apk
	./yun_bash/push.sh ./out/$project $location
	read -p "返回上一级请输入：e:    " ex
	if [[ "$ex" == "e" ]]; then
		break
	fi
done