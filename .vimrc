set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"github repos
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T.git'
Bundle 'mattn/gist-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'shawncplus/skittles_berry'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
"look into supertab-continued
Bundle 'ervandew/supertab'
Bundle 'mattn/webapi-vim'
Bundle 'tpope/vim-rails'

filetype plugin indent on

set number
set ruler

"tab stuff
set tabstop=2
set expandtab
set shiftwidth=2

"cut down on rage
:command WQ wq
:command Wq wq
:command W w
:command Q q

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20
" make command-t open in new tab
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Vim-powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" colors
set t_Co=256
syntax enable
colorscheme skittles_berry

" dir for .swp files
set backupdir=~/.vim/swp
set directory=~/.vim/swp

" pasting
map <Leader>p :set paste!<CR>

map <Leader>nn :set number!<CR>

" alignment 
map <Leader>= ggVG=<CR>

