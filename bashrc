# .bashrc

[ -f /etc/bashrc ] && . /etc/bashrc


## aliases ##

alias l='/bin/ls -hF'
alias ll='l -l'
alias la='l -a'
alias lla='l -la'


## environment ##

export PAGER=less
export EDITOR=vim

export HISTSIZE=1024
export HISTFILESIZE=1024


## path ##

export PATH="$HOME/.local/bin:/usr/local/bin:${PATH}"

if [ -d /snap/bin ] ; then
  export PATH="$PATH:/snap/bin"
fi


## prompt ##

txtblk='\033[0;30m'  # Black - Regular
txtred='\033[0;31m'  # Red
txtgrn='\033[0;32m'  # Green
txtylw='\033[0;33m'  # Yellow
txtcyn='\033[0;36m'  # Cyan
txtwht='\033[0;37m'  # White
bldblk='\033[1;30m'  # Black - Bold
bldred='\033[1;31m'  # Red
bldgrn='\033[1;32m'  # Green
bldylw='\033[1;33m'  # Yellow
bldcyn='\033[1;36m'  # Cyan
bldwht='\033[1;37m'  # White
txtrst='\033[0m'     # Reset

case $TERM in
  xterm-color|*-256color)
    PS1="[\[$txtcyn\]"'\u'"\[$txtrst\]"
    PS1="$PS1@\[$bldcyn\]"'\h'"\[$txtrst\]"
    PS1="$PS1:\[$txtwht\]"'\w'"\[$txtrst\]]\n"
    PS1="$PS1\[$bldylw\]"'\$'"\[$txtrst\] "
    ;;

  *)
    PS1='\u@\h:\w$ '
    ;;
esac

export PS1

set -o vi
