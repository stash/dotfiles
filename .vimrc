let mapleader=","
nnoremap Q <nop> " disable ex mode

syntax on
syntax sync fromstart
set hlsearch " Highlight matches.
set background=dark
colorscheme evening
if has('gui_running')
	set guifont=Inconsolata-Regular:h14
	imap <C-BS> <C-W>
endif

filetype plugin indent on

if has('mouse')
    set mouse=a " pass in mouse events if term supports it
endif

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set incsearch                     " Highlight matches as you type.
set wrap                          " Turn on line wrapping.
set splitright                    " cursor goes right on vsplit
set autowrite autoread            " automatically write/read when suspending, etc.
set exrc

set ignorecase  " default to case-insensitive searches
set smartcase   " go case-sensitive when MixedCase searching

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2 " always

function! GetFileEncoding()
    let str = &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = &fileencoding . ':' . str
    endif
    let str = '[' . str
    return str
endfunction

set statusline=%y " filetype
set statusline+=%{GetFileEncoding()} " see above
set statusline+=%t " filename (just the file part)
set statusline+=%m " modified flag
set statusline+=%r " readonly flag
set statusline+=\  " one space
set statusline+=%LL

set statusline+=%= " switch to right side
set statusline+=>
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* " reset syntax
set statusline+=<
set statusline+=\  " one space
set statusline+={0x%B} " hex of character under cursor
set statusline+=\  " one space
set statusline+=%l:%c

" nice indenting
set tabstop=4
set shiftwidth=0
set noexpandtab
set autoindent
set smartindent

set grepprg=rg

map <F2> :nohlsearch
map <F3> :grep <C-R><C-W><CR><CR>
map <F4> :w<CR>:make<CR>:cw<CR>
map <F5> :SyntasticToggleMode<CR>:redraw!<CR>
map <F6> :%s/ \+$//g<CR>
set pastetoggle=<F12>

set directory=~/.vimtmp//
if strlen($TMPDIR) > 0
	set directory+=$TMPDIR//
endif

set updatetime=200 " ms, for things like gitgutter
