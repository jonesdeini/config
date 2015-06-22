set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" github repos
Plugin 'ervandew/supertab'
Plugin 'gmarik/vundle'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'jonesdeini/vim-golang'
Plugin 'juvenn/mustache.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/skittles_berry'
Plugin 'tpope/gem-ctags'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'

" vim-script repos
Plugin 'ack.vim'
Plugin 'dbext.vim'

call vundle#end()
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
:command Q q
:command QA qa
:command Qa qa
:command W w
:command WQ wq
:command Wq wq

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

"Ctrlp
map <leader>t :CtrlPCurWD<cr>
let g:ctrlp_match_window_reversed=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_map = ''

" Guardfile is Ruby
au BufRead,BufNewFile {Guardfile} set ft=ruby

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

" buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>

" colors
set t_Co=256
syntax enable
colorscheme skittles_berry

set noswapfile

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

" disable arrow keys
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

" show commands for tab completion
set wildmenu

" awesomeness
:vnoremap . :norm.<CR>
