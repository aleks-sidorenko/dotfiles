" Plugins!
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

" Setting

set nocompatible              " be iMproved, required
filetype off                  " required

" Update time for gitgutter
set updatetime=250
" Colours
colorscheme dracula
" Show numbers
set number
" Show statusline
set laststatus=2
" Highlight code
syntax on
" NERDTree
map <C-n> :NERDTreeToggle<CR>
" Mouse on
set mouse=a
" set Search Highlight by default on 
set hls

" Make copy-paste to work C-c & C-v
set clipboard^=unnamed,unnamedplus

" Key bindings

" Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Use FZF together with NERDTree
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"