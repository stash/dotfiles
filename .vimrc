call pathogen#infect()
call pathogen#helptags()

let g:syntastic_check_on_open=1
let g:syntastic_enable_baloons=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1 " open automatically when errors, closed when none; default 2

syntax on
syntax sync fromstart

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
set splitright                    " cursor goes right on vsplit
set autowrite autoread            " automatically write/read when suspending, etc.
set exrc

set ignorecase  " default to case-insensitive searches
set smartcase   " go case-sensitive when MixedCase searching

" nice indenting
set autoindent
set smartindent

set pastetoggle=<F12>

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2 " always
set statusline=%y%{GetFileEncoding()}%t%m%r%=0x%B\ %c:%l/%L
function! GetFileEncoding()
    let str = &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = &fileencoding . ':' . str
    endif
    let str = '[' . str
    return str
endfunction

set tabstop=8
set shiftwidth=4
set expandtab
set smarttab

set grepprg=ack

map <F3> :grep <C-R><C-W><CR><CR>
map <F4> :w<CR>:make<CR>:cw<CR>
map <F5> :SyntasticToggleMode<CR>:redraw!<CR>
