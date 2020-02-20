" Leader Key
let mapleader = "\<Space>"

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0


" Custom Key Mappings
" ===================

" 0 moves cursor to first word in line instead of bol
nmap 0 ^

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" Escape from insert mode
imap jk <esc>
imap kj <esc>

" Copy the entire buffer into the system register
nmap <leader>co ggVG*y

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk


" Setting Options
" ===============

" Display relative line numbers, with absolute line number for current line
set number
set numberwidth=5
set relativenumber

set autowrite       		" Automatically :write before running commands	
set backspace=indent,eol,start  " Sane backspace behavior
set hidden                      " Allow buffer change w/o saving
set history=1000                " Remember last 1000 commands
set laststatus=2     		" Always display the status line
set lazyredraw                  " Don't update while executing macros
set nocompatible                " Don't maintain compatibilty with Vi.
set number                      " Display line numbers beside buffer
set ruler            		" show the cursor position all the time
set scrolloff=4                 " Keep at least 4 lines below cursor
set showcmd         		" display incomplete commands


" Autocommands
" ============

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>


" Plugins
" =======

" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'nanotech/jellybeans.vim'

call plug#end()

:colorscheme jellybeans



