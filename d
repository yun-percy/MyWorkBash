#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝
#写于2014年4月 深圳语信公司
#写于2014年6月 深圳语信公司
#写于2014年7月 深圳云雀公司
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH

filepath=`pwd`
project=$1
echo $filepath
filename=`echo $project | awk -F. '{print $1}'`

if [ ! -d "${filepath}/${project}" ]; then

rm -rf $filename 2>/dev/null
 ~/yun/apktool d ${filepath}/${project}
else
	# //project="${project}.zip"
	read -p "以存在反编译文件夹，是否删除？(y/n)" y
	if [[ "$y" == "y" ]]; then
		rm -rf $filename 2>/dev/null
	fi
	~/yun/apktool d ${filepath}/${project}.apk
fi
#echo $filename


