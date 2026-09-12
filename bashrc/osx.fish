# Homebrew (Apple Silicon path -- adjust to /usr/local if ever on Intel)
if test -d /opt/homebrew/bin
    eval (/opt/homebrew/bin/brew shellenv fish)
end

alias ls 'ls -lahFG'
