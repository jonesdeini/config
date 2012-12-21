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
alias gst="git status"

#PS1='[\W]\$ '

# write a function to compute the current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set the PS1 variable
PS1="\w\[\e[0;36;49m\]\$(parse_git_branch)\[\e[0;0m\]$ "

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
case $(uname -s) in
  Darwin)
    if [ -f `brew --prefix`/etc/autojump ]; then
      . `brew --prefix`/etc/autojump
    fi
  ;;
  Linux)
    # hate this
    source /etc/profile
  ;;
esac

# tab completion for git
case $(uname -s) in
  Darwin)
    # not checking if it exists bc we want it to complain if it doesn't exist
    source /usr/local/git/contrib/completion/git-completion.bash
  ;;
  Linux)
    # ubuntu only???
    if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
    # arch only???
    if [ -f /usr/share/git/completion/git-completion.bash ]; then
        source /usr/share/git/completion/git-completion.bash
    fi
  ;;
esac

# phantomjs lives here
PATH=~/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
