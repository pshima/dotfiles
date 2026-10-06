" Vim skips its built-in defaults.vim when a .vimrc exists; load it explicitly
" (incsearch, scrolloff, showcmd, wildmenu, sane backspace, etc.)
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Auto-install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug setup (plug#end turns on filetype plugin indent and syntax)
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'

call plug#end()

set history=500
set number

set autoread

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
set timeoutlen=500

try
    colorscheme desert
catch
endtry

set encoding=utf8

set fileformats=unix,dos

set expandtab

set smarttab

set shiftwidth=2
set tabstop=2

set ai
set si
set wrap

set laststatus=2

set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
