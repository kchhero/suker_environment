
# some more ls aliases
alias ll='ls -alF --block-size=K'
alias la='ls -A'
alias l='ls -CF'
alias gr='grep -n -i -r'
alias gitpatch='git diff --no-prefix > '
alias ee='env TERM=xterm-256color emacs -nw'
#alias ee='emacs -nw'

myfilefind()
{
	find . -name $1
}
alias fnf=myfilefind

myPyuicConvert()
{
	pyuic5 -x *.ui -o $1
}
alias pyc8=myPyuicConvert
	
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
    find . -name '*' -type f -print0 | xargs -0 grep --color -n $1 --exclude-dir=$2
}
alias _gra=myfilefindgrep_all

gitc8()
{
    git clean -f -d;git checkout -f
}

myGitLogging()
{
    if [ -z $1 ];then
	git log --pretty=oneline
    else
	git log --pretty=oneline --grep $1
    fi
}
alias _gl=myGitLogging

myFileCountInDir()
{
    ls -R $1 | wc -l
}
alias _cntF=myFileCountInDir

repoallclean()
{
    find . -type d -name ".git" | xargs -I {} sh -c 'cd {};cd ..;git clean -f -d;git checkout -f'
}
alias repocln=repoallclean

# ---- suker keybinding -----
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
