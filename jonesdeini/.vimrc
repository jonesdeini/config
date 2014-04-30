set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" github repos
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'jonesdeini/vim-golang'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'shawncplus/skittles_berry'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'

" vim-script repos
Bundle 'ack.vim'
Bundle 'dbext.vim'

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
