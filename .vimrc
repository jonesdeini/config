set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"github repos
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'jonesdeini/vim-comment-blocks'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'shawncplus/skittles_berry'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-vividchalk'
Bundle 'wincent/Command-T.git'
"vim-script repos
Bundle 'ack.vim'
Bundle 'buftabs'
Bundle 'twilight256.vim'

filetype plugin indent on

" formatting stuff
set number
set ruler

" whitespace raaaaaaaggggeeeee
set list listchars=tab:\¶¤\,trail:¡,eol:¬

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
"let g:CommandTAcceptSelectionMap = '<C-t>'
"let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTAlwaysShowDotFiles = 1

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
set encoding=utf-8
set laststatus=2
set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline
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

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" switch b/t buffers
map <C-p> :bp <CR>
map <C-n> :bn <CR>

" stop being a noob 
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" ; to  :
" just dont have the accuracy for this right meow
"noremap ; :

" highlight search
set hlsearch
set incsearch

" comment-blocks
imap <silent> ### <C-R>=CommentBlock(input("Enter comment: "))<CR>

" show commands for tab completion
set wildmenu
