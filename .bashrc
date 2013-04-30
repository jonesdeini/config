# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#alias'
alias ec2="ssh -i ~/r0bj0n3s99.pem root@184.73.157.166"
alias resq="QUEUE=* rake resque:work"
alias gst="git status"
alias ga="git add -p"

# write a function to compute the current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/"
}

# set the PS1 variable
PS1="\u@\h \w\[\e[0;36;49m\]\$(parse_git_branch)\[\e[0;0m\]$ "

# extract files eg: ex tarball.tar#
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

# phantomjs lives here
PATH=~/bin:$PATH

# go
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin

#heroku
export PATH=$PATH:$HOME/heroku-client/bin

#python
export WORKON_HOME=~/.virtualenvs
. /usr/bin/virtualenvwrapper.sh # arch specific?

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# os specific configs
case $(uname -s) in
  Darwin)
    . ~/config/bashrc/osx
  ;;
  Linux)
    . ~/config/bashrc/linux
  ;;
esac
