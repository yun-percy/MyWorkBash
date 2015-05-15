#!/usr/bin/python
#-*- coding:utf-8 -*-
#此脚本使用在Android 各项处理上
#制作者：振云

import time
import os
import subprocess
LOCAL_PATH=os.getcwd()
os.environ['LOCAL_PATH']=str(LOCAL_PATH)
os.system('echo $LOCAL_PATH')
# from subprocess import call
print ''
print '====================================================='
print 'Android Apktools build command with apktool200rc4.jar'
print 'Android 反编译打包指令，打包版本为: apktool200rc4.jar'
print '打包时间为： ',
print time.strftime('%Y年%m月%d日%H时%M分 周%w',time.localtime(time.time()))
print LOCAL_PATH
r = subprocess.Popen("mkdir $LOCAL_PATH/out 2>/dev/null",shell=True,stdout=subprocess.PIPE)
r.communicate()
returnCode = r.wait()
if returnCode==1:
	print '\033[0;36m',
	print 'can\'t mkdir',LOCAL_PATH,'/out:  ',
	
	out_exitst=os.path.exists(LOCAL_PATH+'/out')
	# print out_exitst
	if out_exitst :
		print 'folder exists'
		print ''
	else:
		print '\033[0;31m',
		print 'perssion denied,or other error'
		print '\033[0m',
	print '\033[0m',
else:
	print '\033[0;31m',
	print 'successed!'
	print '\033[0m',


print 'finish'
print '\033[0;36m',
print 'lightplue'
print '\033[0m',