#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
location=$2
Resources_location=$3
DATE=$4

echo 正在进入源码目录，请稍候......
echo 
cd ../code/cm10.1
echo 开始初始化编译环境......
echo
. build/envsetup.sh
echo 初始化 find5的编译环境.....
echo
breakfast find5
echo
echo 初始化成功，即将开启编译模式
echo
echo
echo
for (( i = 0; i < 100; i++ )); do					
	echo
	echo 正在编译源码$project.apk 请稍候......
	echo
	echo
	mmm ${Resources_location}/${project}
	echo
	echo
	echo 返回 推送目录……
	echo
	cd ../../Workspace
	mv ./out/$project.apk ./out/${project}$DATE.apk
	echo Copying.....
	cp ../code/cm10.1/out/target/product/find5/$location/${project}.apk ./out/${project}2.apk
	echo
	echo
	echo Signing.....
	java -jar signapk.jar testkey.x509.pem testkey.pk8 ./out/${project}2.apk ./out/${project}.apk
	echo
	echo
	./yun_bash/push.sh $project $location
	echo
	echo 任意键开始下一轮编译
	echo
	read -p "返回上一级请输入：e:    " ex
	if [[ "$ex" == "e" ]]; then
	break
	fi
	cd ../code/cm10.1
done
