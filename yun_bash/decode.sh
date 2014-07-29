#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
DATE=$2
ls
rm -rf $project
cp ./out/$project.apk ./$project.apk
./apktool d $project.apk
while [ $? = 1 ]; do
	./apktool d $project.apk $project
	#statements
done