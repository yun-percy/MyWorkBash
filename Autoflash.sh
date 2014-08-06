#!/bin/bash
#此脚本用来 DIY ROM 用
#制作者：陈云
#写于2014年3月 窝窝
#写于2014年4月 深圳语信公司
#写于2014年6月 深圳语信公司
#写于2014年7月 深圳云雀公司
PATH=/bin:/sbin:/usr/bin:usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/yun
export PATH
###########################
package="$1"
###########################
if [[ "$package" == "" ]]; then
	echo -e "\033[31mno package will install \033[0m"
	echo -e "\033[31minstall aborted\033[0m"
fi
adb push $package sdcard/update.zip
while [ $? = 1 ]; do
	echo -e "\033[31msome thing errot here , I will try in 2 seconds\033[0m"
	sleep 2
	adb push $package sdcard/update.zip
done
# adb shell su -c "echo 'boot-recovery' > /cache/recovery/command"
adb shell su -c "echo '--wipe_data' >> cache/recovery/command"
adb shell su -c "echo '--wipe_cache' >> cache/recovery/command"
adb shell su -c "echo '--carry_out=csc_home' >> cache/recovery/command"
# adb shell su -c "echo '--update_package=SDCARD:update.zip' >> cache/recovery/command"
# adb shell su -c "echo '--update_package=SDCARD:update.zip' >> cache/recovery/command"
adb shell su -c "echo '--update_package=EMMC:update.zip' >> cache/recovery/command"
#adb shell su -c "echo '--update_package=emmc/0/update.zip' >> cache/recovery/command"
# adb shell su -c "echo '--update_package=EMMC/update.zip' >> cache/recovery/command"
#adb shell su -c "echo '--update_package=EMMC/0/update.zip' >> cache/recovery/command"
adb shell su -c "chown root:root /cache/recovery/command"
adb shell su -c "chmod 0644 /cache/recovery/command"

read
adb reboot recovery
