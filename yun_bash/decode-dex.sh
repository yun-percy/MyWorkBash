#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
DATE=$2
location=$3
reset
echo 欢饮使用linux 一键查看源代码工具
echo 正在移除原来文件......
mkdir ./src_decode
mv ./src_decode/$project ./src_decode/${project}$DATE
echo 创建新文件夹.....
mkdir ./src_decode/$project
echo 解压APK文件......
cp ./out/$project.apk ./src_decode/$project.apk
unzip ./src_decode/$project.apk -d ./src_decode/$project/
echo 重命名文件......
mv ./src_decode/$project/classes.dex ./src_decode/$project/${project}_classes.dex
echo 反编译dex文件......
./dex2jar/dex2jar.sh ./src_decode/$project/${project}_classes.dex
echo 反编译jar文件......
cp ./src_decode/$project/${project}_classes_dex2jar.jar ./$project/${project}_classes_dex2jar.jar
echo 反编译完成,正在打开......
./dex2jar/jd-gui ./$project/${project}_classes_dex2jar.jar