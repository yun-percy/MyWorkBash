#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
DATE=$2 
echo Signing.....
java -jar signapk.jar testkey.x509.pem testkey.pk8 ./out/$project.apk ./out/${project}2.apk
mv ./out/$project.apk ./out/${project}${DATE}.apk
mv ./out/${project}2.apk ./out/${project}.apk