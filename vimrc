"
" Plugins!
"
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'dag/vim-fish'
Plug 'derekwyatt/vim-scala'
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'

call plug#end()

"
" Setting
"

" Forget compatibility with Vi. Who cares.
set nocompatible

"Enable filetypes
filetype on

filetype plugin on
filetype indent on

" Highlight code
syntax on

" Update time for gitgutter
set updatetime=250

" Ever notice a slight lag after typing the leader key + command? This lowers the timeout.
set timeoutlen=500

" Colours
colorscheme dracula
" Show numbers
set number

" Show statusline
set laststatus=2

set hidden

" Show the cursor position all the time
set ruler

" Split vertical windows right to the current windows
set splitright

" Split horizontal windows below to the current windows
set splitbelow

 " Set default encoding to UTF-8
set encoding=utf-8             
set termencoding=utf-8
" Set default encoding to UTF-8 and add russian encodings
set fileencodings=utf-8,cp1251,cp866,koi8-r

 " Automatically save before :next, :make etc.
set autowrite

 " Automatically reread changed files without asking me anything
set autoread

" Show me what I'm typing
set showcmd

" Show current mode.
set showmode

" Don't use swapfile
set noswapfile

" Don't create annoying backup files
set nobackup
set nowritebackup

" Mouse on
set mouse=a

" set Search Highlight by default on 
set hls

" Make copy-paste to work C-c & C-v
set clipboard^=unnamed,unnamedplus

"
" Key bindings
"
" Map leader first
let mapleader = ","
let g:mapleader = ","


" Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Use FZF together with NERDTree
nnoremap <silent> <expr> <leader><leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<CR>"

" Open terminal/console in the bottom
nnoremap <C-t> :wincmd b \| bel terminal<CR>