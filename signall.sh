#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝
#请将这个脚本放置在 与system相同的目录下。另外请给它赋予执行权限

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

filepath=`pwd`
device=$1
DATE=$2 
cd $filepath

sign_app(){
  for i in *.apk;do
   echo "正在签名 $i ...... "
   java -jar ~/yun/signapk.jar ~/yun/testkey.x509.pem ~/yun/testkey.pk8 $i sign_$i
   mv ./sign_$i ./$i
   echo "完成签名 $";
 done
}
cd $filepath/system/framework
echo "cd framework"
sign_app
cd $filepath/system/app 
echo "cd app"
sign_app
cd $filepath/system/app-2 2>/dev/null
echo "cd app-2"
sign_app
cd $filepath/system/priv-app 2>/dev/null
echo "cd priv-app"
sign_app
cd ~
cd $filepath/framework
echo "cd framework"
sign_app
cd $filepath/app 
echo "cd app"
sign_app
cd $filepath/app-2 2>/dev/null
echo "cd app-2"
sign_app
cd $filepath/priv-app 2>/dev/null
echo "cd priv-app"
sign_app
