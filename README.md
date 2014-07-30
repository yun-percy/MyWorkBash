the shell script of yun   云的shell脚本集
============================================
		those script is used to do some work for android
		这些脚本是用来做一些安卓方面的工作，因为他包含了：
		its inclue:
		apktool
		adb 
		aapt 
		dump 
		sign
		root
		mtktools

HOW TO INSTALL IT 如何安装
---------
> clone it or download it    克隆或者直接下载

		git clone https://github.com/poshinton/MyWorkBash

> copy it in your homepage and rename it with name of "yun"  将它拷贝到你的主目录下并且重命名为"yun"

		cp -r MyWorkBash ~ && mv ~/MyWorkBash ~/yun

> add it in your envirment (if you don't know how to add it please google!)   
将它加入环境变量，如果你不会的话，请百度

HOW TO USE IT 如何使用
------

### apktool
> d  : decode

		d example.apk =apktool d example.apk

> b   :build

		b example = apktool b example ./out

> f   :if

		f framework-res = apktool if framework-res.apk

### adb
> i 	:install -r		

		i example = adb install -r example.apk

> s    :sideload

		s YunSunRoot.zip = adb sideload  YunSunRoot.zip

> re   :reboot

		re = adb reboot

> reco   :recovery

		reco = adb reboot recovery

> bo  		:bootloader

		bo = adb reboot bootloader

> root 		:root your devices

		root = adb sideload YunSunRoot.zip

### sign
> sign   

		sign example.apk

>signall.sh
> you must puth signall.sh in your ROM  root folder which have "system" "META-INF"  "boot.img" etc.
> 你必须把signall.sh放置在ROM的根目录，就是与system,META-INF相同的那个目录。然后双击它即可
> and click it

### shell
>rmount  : IT IS NOT remount  but rm out
> when you use b  build some apk many times,it will build many history apks in out folder.if your make sure don't need it ,them you can use it deleted.
>当你使用b命令建立apk的时候，如果你使用多次会生成很多历史apk.当你确定不需要这些apk时，你可以使用这个命令删除out下的所有历史apk

		rmout=rm out/*2014* && rm out/*de*


### Github
> .git-completion.bash  自动补全脚本
> put it on your home directory 将这个文件拷贝到主目录
> add those code to ~/.bash_profile   将下面代码添加到~/.bash_profile

		if [ -f ~/.git-completion.bash ]; then
    			. ~/.git-completion.bash
		fi

>done 完成
