# .bashrc
# User specific aliases and functions
# Source global definitions ------------
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi
#设置操作系统语言环境为中国大陆，字符 编码为UTF-8
export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
#设置命令搜索路径
export PATH="${PATH}"":${HOME}/bin" 开头或结尾放置冒号，也不要在中间放置一对没有路径的冒号。
export LD_LIBRARY_PATH="/usr/lib64:/home/test/mysql/lib/mysql"
export PS4='+{$LINENO:${FUNCNAME[0]}} ')提示符
#设置ls命令根据文件类型、后缀名，展示为不同的颜色
LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.z
ip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;3
:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:'
export LS_COLORS
#设置less命令终端功能相关变量，以下设置让man手册页（用less格式化）在运行时有相应的颜色
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
#设置默认编辑器，为一些工具（如mail）指定使用哪个文本编辑器
export EDITOR='vim'
#设置一些开发构建工具环境变量
export MAVEN_HOME=/home/esse/soft/apache-maven-3.5.3
export PATH=$MAVEN_HOME/bin:$PATH
export JAVA_HOME=/home/esse/soft/jdk1.8.0
export PATH=$JAVA_HOME/bin:$PATH
export GRADLE_HOME=/home/esse/soft/gradle-4.5
export PATH=$GRADLE_HOME/bin:$PATH
export SCALA_HOME=/home/esse/soft/scala-2.12.6
export PATH=$SCALA_HOME/bin:$PATH
export SPARK_HOME=/home/esse/soft/spark-2.1.0-bin-hadoop2.6
export PATH=$SPARK_HOME/bin:$PATH
#设置默认分页工具
export PAGER='less'
shopt -s histappend shell的特性，下面一行命令用于便面历史命令发生覆盖
export HISTSIZE=100000 的条数
export HISTFILESIZE=409600 尺寸
export HISTIGNORE="&:ls:ll:la:pwd:history:id:uptime"
export HISTCONTROL='erasedups' ，删除所有相同的历史记录，还可以设置为ignoredups，表示忽略重复的输入（和上一次的输入比较）
# 1.进入目录，执行 s dir_name（一个能记得住的字符串）串快速进入常用目录
# 2.怎样进入刚才设置的目录，执行 g dir_name 刚刚设置的字符串
#------------------------------------------------------------------------
# bookemark -----------------
# bookmark USAGE :
# s bookmarkname - saves the curr dir as bookmarkname
# g bookmarkname - jumps to the that bookmark
# g b[TAB] - tab completion is available
# l - list all bookmarks
# save current directory to bookmarks
touch ~/.sdirs
function s {
cat ~/.sdirs | grep -v "export DIR_$1=" > ~/.sdirs1
mv ~/.sdirs1 ~/.sdirs
echo "export DIR_$1=$PWD" >> ~/.sdirs
}
# jump to bookmark
function g {
source ~/.sdirs
cd $(eval $(echo echo $(echo \$DIR_$1)))
}
# list bookmarks with dirname
function l {
source ~/.sdirs
env | grep "^DIR_" | cut -c5- | grep "^.*="
}
# list bookmarks without dirname
function _l {
source ~/.sdirs
env | grep "^DIR_" | cut -c5- | grep "^.*=" | cut -f1 -d "="
}
# completion command for g
function _gcomp {
local curw
COMPREPLY=()
curw=${COMP_WORDS[COMP_CWORD]}
COMPREPLY=($(compgen -W '`_l`' -- $curw))
return 0
}
# bind completion command for g to _gcomp
complete -F _gcomp g
#------------------------------------------------------------------------
# 这一部分最好放在最后，主要是因为前面的脚本可能会用到下面的命令
# php解释器路径，常常要指定 配置文件
alias php="/home/user/x86_64/local/php/bin/php -c /home/user/local/php/etc/php.ini"
alias readlink="readlink -f" 一个文件的绝对路径，复制文件的时候经常用到
# 使grep 出来的结果中，关键字高亮展示
alias grep="grep --color "
alias fgrep="fgrep --color"
alias lsof="/usr/sbin/lsof" 络端口，如果不想把/usr/sbin放置到PATH中，可以设置下面的别名
# 下面的设置用于阻止less退出后刷新屏幕
alias less="less -X"
## ls 相关设置
alias l='ls'
alias ll='ls -l'
# 展示隐藏文件
alias la='ls -a'
alias lf='ls -CF'
# 按文件扩展名展示
alias lx='ls -lXB'
# 按照文件大小排序展示
alias lk='ls -lSr'
alias lt='ls -ltr'
# 关闭命令执行出错报警铃声
setterm -blength 0中设置 set bell-style none用于关闭shell（例如自动补全失败）的告警铃声
