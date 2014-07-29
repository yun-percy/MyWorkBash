#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

filepath=`pwd`
project=$1
echo $filepath
filename=`echo $project | awk -F. '{print $1}'`
rm -rf $filename 2>/dev/null
 ~/yun/apktool d ${filepath}/${project}

echo $filename
while [ $? = 1 ]; do
	~/yun/apktool d $project.apk $filepath
	#statements
done