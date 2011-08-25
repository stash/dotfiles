set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.

" nice indenting
set autoindent
set smartindent

set tabstop=8
set shiftwidth=4
set expandtab
set smarttab

map <F4> :w<CR>:make<CR>:cw<CR>
map <F3> :w<CR>:!./node_modules/.bin/vows\ %<CR>
