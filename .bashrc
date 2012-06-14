# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias'
case $(uname -s) in
  Darwin)
    alias ls='ls -lahFG'
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    export EDITOR="/Applications/MacVim.App/Contents/MacOS/Vim"
  ;;
  Linux)
    alias ls='ls --color=auto -lahF'
    export EDITOR="vim"
  ;;
esac
alias ec2='ssh -i ~/r0bj0n3s99.pem root@184.73.157.166'
alias resq='QUEUE=* rake resque:work'

PS1='[\W]\$ '

##################
# stolen from: http://signalboxes.net/configs/bashrc-for-linux-and-mac/
# extract files eg: ex tarball.tar#
##################
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       rar x $1      ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# chmod +x bin/git-edit
export PATH="$PATH:~/config/bin"

# autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi
