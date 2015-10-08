"vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" go linter
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

set history=500
set number
set nowrap

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

" Automatically run go linter
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

"leave powerline out for now
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim
"set t_Co=256
