#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝
#请将这个脚本放置在 与system相同的目录下。另外请给它赋予执行权限

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

device=$1
DATE=$2 
cd system/framework
for i in *.apk;do
   echo "正在签名 $i ...... "
   java -jar ~/yun/signapk.jar ~/yun/testkey.x509.pem ~/yun/testkey.pk8 $i sign_$i
   mv ./sign_$i ./$i
   echo "完成签名 $i ";
done

cd ../app
for i in *.apk;do
   echo "正在签名 $i ...... "
   java -jar ~/yun/signapk.jar ~/yun/testkey.x509.pem ~/yun/testkey.pk8 $i sign_$i
   mv ./sign_$i ./$i
   echo "完成签名 $i ";
done
cd ../
if [ ! -d "/app-2" ]; then
   echo "cd app-2"
   cd app-2
   for i in *.apk;do
        echo "正在签名 $i ...... "
        java -jar ~/yun/signapk.jar ~/yun/testkey.x509.pem ~/yun/testkey.pk8 $i sign_$i
        mv ./sign_$i ./$i
        echo "完成签名 $i ";
   done
fi
cd ..
if [ ! -d "/priv-app" ]; then
   cd priv-app
   for i in *.apk;do
          echo "正在签名 $i ...... "
          java -jar ~/yun/signapk.jar ~/yun/testkey.x509.pem ~/yun/testkey.pk8 $i sign_$i
          mv ./sign_$i ./$i
          echo "完成签名 $i ";
          done
fi
cd ../../../
