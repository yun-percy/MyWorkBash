#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

reset
echo 欢饮使用linux 一键查看源代码工具
DATE=`date "+%Y-%m-%d-%H:%M:%S" `
echo 正在移除原来文件......

mv ./src_decode/Phone ./src_decode/Phone$DATE
echo 创建新文件夹.....
mkdir ./src_decode/Phone
echo 解压APK文件......
unzip ./src_decode/Phone.apk -d ./src_decode/Phone/
echo 重命名文件......
mv ./src_decode/Phone/classes.dex ./src_decode/Phone/Phone_classes.dex
echo 反编译dex文件......
./dex2jar/dex2jar.sh ./src_decode/Phone/Phone_classes.dex
echo 反编译jar文件......
echo 反编译完成,正在打开......
./dex2jar/jd-gui ./src_decode/Phone/Phone_classes_dex2jar.jar