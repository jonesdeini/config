set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'wincent/Command-T.git'

filetype plugin indent on

:command WQ wq
:command Wq wq
:command W w
:command Q q