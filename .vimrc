" Auto-install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug setup
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'

call plug#end()
filetype plugin indent on

set history=500
set number

filetype plugin on
filetype indent on
set autoread

command W w !sudo tee % > /dev/null

set cmdheight=2

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch

set lazyredraw

set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable

try
    colorscheme desert
catch
endtry

set encoding=utf8

set ffs=unix,dos,mac

set expandtab

set smarttab

set shiftwidth=2
set tabstop=2

set ai
set si
set wrap

set laststatus=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
