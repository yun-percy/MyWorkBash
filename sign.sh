#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
DATE=`date "+%Y%m%d%H%M" `
echo Signing.....
java -jar signapk.jar testkey.x509.pem testkey.pk8 $project.apk ${project}2.apk
mv $project.apk ${project}${DATE}.apk
mv ${project}2.apk ${project}.apk