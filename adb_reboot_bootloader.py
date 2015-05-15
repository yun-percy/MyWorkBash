#!/usr/bin/python
#-*- coding:utf-8 -*-
#此脚本使用在Android 各项处理上
#制作者：振云
import time
import os
import subprocess

r = subprocess.Popen("adb reboot bootloader",shell=True,stdout=subprocess.PIPE)
r.communicate()
returnCode = r.wait()