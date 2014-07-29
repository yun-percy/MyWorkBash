#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝

PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
mode=$1
if [[ $mode == "1" ]]; then
	adb reboot recovery
elif [[ $mode == "2" ]]; then
	adb reboot bootloader
else adb reboot
fi