#这些别名真的很简单并且真的很短，但他们大多数是为了给你的生命节省几秒钟，最终也许为你这一辈子节省出来几年，也许呢。

#环境变量设置
export PATH=$PATH:~/yun:~/yun/bootimg_tools_7.8.13:~/bin:./


alias ls="ls --color=auto -F -h"
#简单但非常重要。使ls命令带着彩色输出。

alias ll="ls --color -al"
#以彩色的列表方式列出目录里面的全部文件。

PS1='\[\e[32;1m\]\A \[\e[33;1m\]\w \[\e[34;1m\]$ \[\e[0m\]'
#重定义提示符

alias grep='grep --color=auto'
#类似，只是在grep里输出带上颜色。

mcd() { mkdir -p "$1"; cd "$1";}
#我的最爱之一。创建一个目录并进入该目录里： mcd [目录名]。


cls() { cd "$1"; ls;}
#类似上一个函数，进入一个目录并列出它的的内容：cls[目录名]。

backup() { cp "$1"{,.bak};}
#简单的给文件创建一个备份: backup [文件] 将会在同一个目录下创建 [文件].bak。

md5check() { md5sum "$1" | grep "$2";}
#因为我讨厌通过手工比较文件的md5校验值，这个函数会计算它并进行比较：md5check[文件][校验值]。



alias makescript="fc -rnl | head -1 >"
#很容易用你上一个运行的命令创建一个脚本：makescript [脚本名字.sh]

alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
#只是瞬间产生一个强壮的密码。



alias c="clear"
#清除你终端屏幕不能更简单了吧？

alias histg="history | grep"
#快速搜索你的命令输入历史：histg [关键字]

alias ..='cd ..'
#回到上层目录还需要输入 cd 吗？

alias ...='cd ../..'
#自然，去到上两层目录。

extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
#很长，但是也是最有用的。解压任何的文档类型：extract: [压缩文件]

#系统信息

#想尽快地知道关于你的系统一切信息？

alias cmount="mount | column -t"
#按列格式化输出mount信息。



# alias tree="ls -R | grep "" | sed -e 's///' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
#以#树形结构递归地显示目录结构。

sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
 #安装文件在磁盘存储的大小排序，显示当前目录的文件列表。

alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
#接管某个进程的标准输出和标准错误。注意你需要安装了 strace。

alias meminfo='free -m -l -t'
#查看你还有剩下多少内存。



# alias ps1= "ps aux | grep"
#可以很容易地找到某个进程的PID：ps? [名字]。

alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"
#显示当前音量设置。

#网络

#对于所有用在互联网和本地网络的命令，也有一些神奇的别名给它们。

alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
#下载整个网站：websiteget [URL]。

alias listen="lsof -P -i -n"
#显示出哪个应用程序连接到网络。

alias port='netstat -tulanp'
#显#示出活动的端口。

# gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}
#大概的显示你的谷歌邮件里未读邮件的数量：gmail [用户名]

alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"
#获得你的公网IP地址和主机名。

getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';}
#返回你的当前IP地址的地理位置。

#也许无用

#所以呢，如果一些别名并不是全都具有使用价值？它们可能仍然有趣。

kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}
#绘制内核模块依赖曲线图。需要可以查看图片。

alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"
#在那些非技术人员的眼里你看起来是总是那么忙和神秘。

o:(){
	adb logcat -s System.out
}
e:(){
	adb logcat *:e
}
findout(){
	find . -name "*.$1"  -exec grep -l "$2" {} \;
	#查找根据文件内容查找匹配项　命令结构为　find　后缀名　匹配内容，如：find java void

}
superyun(){
	echo -e "欢迎使用云云版快捷bash：\n
#这些别名真的很简单并且真的很短，但他们大多数是为了给你的生命节省几秒钟，最终也许为你这一辈子节省出来几年，也许呢。 \n
ls\t#简单但非常重要。使ls命令带着彩色输出。\n
ll\t#以彩色的列表方式列出目录里面的全部文件。\n
grep\t#类似，只是在grep里输出带上颜色。\n
mcd\t#我的最爱之一。创建一个目录并进入该目录里： mcd [目录名]。
cls()\t#类似上一个函数，进入一个目录并列出它的的内容：cls[目录名]。\n
backup\t#简单的给文件创建一个备份: backup [文件] 将会在同一个目录下创建 [文件].bak.\n
md5check\t#因为我讨厌通过手工比较文件的md5校验值，这个函数会计算它并进行比较：md5check[文件][校验值]。\n
makescript\t#很容易用你上一个运行的命令创建一个脚本：makescript [脚本名字.sh]\n
genpasswd\t#只是瞬间产生一个强壮的密码。\n
c\t#清除你终端屏幕不能更简单了吧？\n
histg\t#快速搜索你的命令输入历史：histg [关键字]\n
..\t#回到上层目录还需要输入 cd 吗？\n
...\t#自然，去到上两层目录。\n
extract\t#很长，但是也是最有用的。解压任何的文档类型：extract: [压缩文件]\n
cmount\t#按列格式化输出mount信息。\n
tree\t#以#树形结构递归地显示目录结构。\n
sbs\t#安装文件在磁盘存储的大小排序，显示当前目录的文件列表。\n
intercept\t#接管某个进程的标准输出和标准错误。注意你需要安装了 strace。\n
meminfo\t#查看你还有剩下多少内存。\n
ps1\t#可以很容易地找到某个进程的PID：ps? [名字]。\n
volume\t#显示当前音量设置。\n
#网络\n
#对于所有用在互联网和本地网络的命令，也有一些神奇的别名给它们。\n
websiteget\t#下载整个网站：websiteget [URL]。\n
listen\t#显示出哪个应用程序连接到网络。\n
port\t#显示出活动的端口。\n
ipinfo\t#获得你的公网IP地址和主机名。\n
getlocation\t#返回你的当前IP地址的地理位置。\n
#也许无用\n
#所以呢，如果一些别名并不是全都具有使用价值？它们可能仍然有趣。\n
kernelgraph\t#绘制内核模块依赖曲线图。需要可以查看图片。\n
busy\t#在那些非技术人员的眼里你看起来是总是那么忙和神秘。\n
logcatout\t#等价于adb logcat -s System.out\n
logcaterror\t#等价于adb logcat *:e\n
findout\t#查找根据文件内容查找匹配项　命令结构为　find　后缀名　匹配内容，如：find java void\n"
}



makerec(){
    make recoveryimage -j16
}
switchjava(){
    sudo update-alternatives --config java
    sudo update-alternatives --config javac
}
source /etc/bash_completion
_fastboot()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="reboot boot flash devices -w reboot-bootloader"

    case "$prev" in
    reboot | devices | -w | reboot-bootloader)
        COMPREPLY=()
        return 0
        ;;
    flash)
        COMPREPLY=( $(compgen -W "boot system recovery radio rpm sbl1 modem tz persist splash aboot" -- $cur ))
        return 0
        ;;
    boot)
        COMPREPLY=( $(compgen -o filenames -G "${cur}*.img"))
        return 0
        ;;
    *)
        local prev2="${COMP_WORDS[COMP_CWORD-2]}"
        local prev3="${COMP_WORDS[COMP_CWORD-3]}"
        if [ "$prev2" == "flash" ];then
            COMPREPLY=( $(compgen -o filenames -G "${cur}*"))
            return 0
        elif [ "$prev2" == "boot" ];then
            COMPREPLY=()
            return 0
        elif [ "$prev3" == "flash" ];then
            COMPREPLY=()
            return 0
        fi
        ;;
    esac

    COMPREPLY=( $(compgen -W "$opts" -- $cur) )
    return 0
}
complete -F _fastboot fastboot
#编辑bashrc快捷键
bashrc(){
    cd ~
    vim ~/.bashrc
    cd -
}
HISTCONTROL=ignoredups
HISTCONTROL=erasedups
shopt -s histappend
PROMPT_COMMAND='history -a'
shopt -s cdspell
set completion-ignore-case on
set visible-stats on
export RUBYOPT="-U -Ku -E utf-8:utf-8"
rename_suffix(){
    read -p "请输入新的后缀名，例如：bak   ：" suffix
    while [ -n "$1" ]
    do
        for i in $1
        do
            realname=`echo $i |sed 's/\(.*\)\..*$/\1/'`
            mv $i ${realname}.$suffix
        done
    shift
    done
}
download(){
    filenames=`echo $1 | awk -F = '{print $2}'`
    wget $1 -O  ~/packages/$filenames
}
