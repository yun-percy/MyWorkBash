#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

project=$1
DATE=$2
location=$3

./yun_bash/decode.sh $project $DATE $location
./yun_bash/decode-dex.sh $project $DATE $location
