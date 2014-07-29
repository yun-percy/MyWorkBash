#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝
#写于2014年4月 深圳语信公司
#写于2014年6月 深圳语信公司
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH

for i in *.apk;do
	echo "正在查看 $i ...... "
	aapt dump badging $i >> yun.xml
	echo " " >>yun.xml
   echo "完成查看$i ";





done
sed -i '/uses/d' yun.xml
sed -i '/app/d' yun.xml
sed -i '/sdk/d' yun.xml
sed -i '/other/d' yun.xml
sed -i '/locales/d' yun.xml
sed -i '/densities/d' yun.xml
sed -i '/target/d' yun.xml
sed -i '/support/d' yun.xml
sed -i '/main/d' yun.xml
sed -i '/native/d' yun.xml
sed -i '/search/d' yun.xml
sed -i "s/'//g" yun.xml
sed -i 's/versionCode.*//g'  yun.xml
sed -i 's/label.*//g'  yun.xml
subl yun.xml