# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias'
alias ls='ls -la --color=auto'
alias ec2='ssh -i ~/r0bj0n3s99.pem root@184.73.157.166'
alias resq='QUEUE=* rake resque:work'

PS1='[\W]\$ '
