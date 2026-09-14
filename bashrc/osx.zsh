# Homebrew (Apple Silicon path -- adjust to /usr/local if ever on Intel)
if [ -d /opt/homebrew/bin ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# mise.run installs mise itself here, but doesn't put it on PATH
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

alias ls='ls -lahFG'
