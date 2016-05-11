# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gr='grep -n -i -r'
alias gitpatch='git diff --no-prefix > '

myfilefind()
{
	find . -name $1 -type f
}
alias fnf=myfilefind
	
mydirfind()
{
	find . ! \( -path './out' -prune \) -name $1 -type d
}
alias fnd=mydirfind

myfilefindgrep_c()
{
	find . -type f -name "*\.c" -print0 | xargs -0 grep --color -n $1
}
alias _grc=myfilefindgrep_c

myfilefindgrep_h()
{
	find . -type f -name "*\.h" -print0 | xargs -0 grep --color -n $1
}
alias _grh=myfilefindgrep_h

myfilefindgrep_mksh()
{
	find . -name "*\.mk" -o -name "*\.sh" -print0 | xargs -0 grep --color -n $1
}
alias _grms=myfilefindgrep_mksh

myfilefindgrep_xml()
{
	find . -type f -name "*\.xml" -print0 | xargs -0 git grep --color -n $1
}
alias _grxml=myfilefindgrep_xml

myfilefindgrep_all()
{
    find . -name '*' -type f -print0 | xargs -0 grep --color -n $1
}
alias _gra=myfilefindgrep_all

mycd()
{
	cd $1 && pwd > ~/pwd
}
alias cd=mycd

gitc8()
{
    git clean -f -d;git checkout -f
}

myGitLogging()
{
	git log --pretty=oneline --grep $1
}
alias _gl=myGitLogging

myFileCountInDir()
{
    ls -R $1 | wc -l
}
alias _cntF=myFileCountInDir

whereSrc()
{
    ~/sukerScripts/arm-linux-androideabi-addr2line -e $1 $2
}
alias _ws=whereSrc

currentGoAndroidRoot()
{
    cd $(gettop)
}
alias goroot=currentGoAndroidRoot

currentGoKernelRoot()
{
    cd $(gettop)/kernel
}
alias gokernel=currentGoKernelRoot

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

currentGoBootableRoot()
{
    cd $(gettop)/bootable
}

currentGoSBL()
{
    cd $(gettop)/../non_HLOS/boot_images
}
alias gosbl=currentGoSBL

repoallclean()
{
    find . -type d -name ".git" | xargs -I {} sh -c 'cd {};cd ..;git clean -f -d;git checkout -f'
}
alias repocln=repoallclean

myGCC()
{
    ARG1=$1
    FFF=".c"
    gcc -v -o $ARG1 $ARG1$FFF
}
alias cert=myGCC

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
LS_COLORS='no=00:fi=00:di=01;35:ln=01;31:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=32;42:st=37;44:ex=01;33:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';

export LS_COLORS

export CRASH_EXTENSIONS=~/bin/crash
export PATH=$HOME/bin/crash:$PATH
export SBCL_HOME=~/sukerLisp/sbcl/lib/sbcl

#CRASH_EXTENSIONS=~/bin/crash
#PATH=$PATH:$CRASH_EXTENSIONS
alias crash_w7='crash --rawdump DDRCS0.BIN@0x0-0x20000000,DDRCS1.BIN@0x20000000-0x20000000 -p 4096 -m phys_base=0x00000 --no_panic --smp vmlinux'
alias crash_y25='crash --rawdump DDRCS0.BIN@0x0-0x20000000 -p 4096 -m phys_base=0x00000 --no_panic --smp vmlinux'
alias crash_cy='crash --rawdump DDRCS0.BIN@0x80000000-0x3fffffff -p 4096 -m phys_base=0x80000000 --no_panic --smp vmlinux'
alias _qu='quota -us suker'
alias _auto='python ~/sukerGitHub/sukerPython/sukerScripts/main.py'
alias _add='cd ~/sukerScripts';ls -al
alias makeEtags='find . -name "*.[chCHsS]" -print | xargs etags -a -o TAGS'

#bind CTRL+UP with 'cd ..'
bind '"\e[1;5A":"cd ..\C-m"' 2> /dev/null
bind '"\eOA":"cd ..\C-m"' 2> /dev/null

export PATH=$PATH:/opt/crosstools/gcc-linaro-4.9-2015.05-x86_64_aarch64-linux-gnu/bin
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
#export PATH=$JAVA_HOME/bin:$PATH
