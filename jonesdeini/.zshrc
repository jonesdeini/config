#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

alias ls='ls --color=auto -lahF'
alias grep='grep --color=auto'
alias gst='git status'
alias ga='git add -p'

parse_git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/"
}

setopt PROMPT_SUBST
PROMPT='[%n@%m %1~]%F{cyan}$(parse_git_branch)%f%# '

# extract files eg: ex tarball.tar.gz
ex () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       rar x "$1"      ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# tab completion (git completion function ships with zsh itself, no
# OS-specific path hunting needed the way bash required)
autoload -Uz compinit
compinit

# mise (tool version manager)
command -v mise > /dev/null && eval "$(mise activate zsh)"

# zoxide
command -v zoxide > /dev/null && eval "$(zoxide init zsh --cmd j)"

# os specific configs
case "$(uname -s)" in
  Darwin)
    [ -f ~/config/bashrc/osx.zsh ] && . ~/config/bashrc/osx.zsh
    ;;
  Linux)
    # nothing arch-specific needed for zsh yet -- compinit covers git
    # completion and zoxide/mise are handled above. Add
    # ~/config/bashrc/arch.zsh here if that changes.
    ;;
esac
