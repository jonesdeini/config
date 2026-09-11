# Homebrew (Apple Silicon path -- adjust to /usr/local if ever on Intel)
if [ -d /opt/homebrew/bin ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

alias ls='ls -lahFG'
