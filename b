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
mkdir $filepath/out 2>/dev/null

	mv $filepath/out/${project}.apk $filepath/out/${project}$DATE.apk 2>/dev/null
	mv $filepath/out/${project}_decode.apk $filepath/out/${project}${DATE}_decode 2>/dev/null
	~/yun/apktool b $filepath/$project -o $filepath/out/${project}_decode.apk
	while [ $? = 1 ]; do
		sleep 3
		~/yun/apktool b $project $filepath/out/${project}_decode.apk
	#statements
	done
	java -jar ~/yun/signapk.jar ~/yun/testkey.x509.pem ~/yun/testkey.pk8 $filepath/out/${project}_decode.apk $filepath/out/${project}.apk
	rm -r $project/build
	rm -r $project/orginal 2> dev/null
