let mapleader=","
" map semi-colon for colon (replaces repeating last f or t movement)
nmap ; :
" disable ex mode:
nnoremap Q <nop>

syntax on
syntax sync fromstart
set hlsearch " Highlight matches.
set background=dark
colorscheme stash
if has('gui_running')
	colorscheme evening
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

map <F3> :grep <C-R><C-W><CR><CR>
map <F4> :nohlsearch
map <F5> :SyntasticToggleMode<CR>:redraw!<CR>
map <F6> :%s/ \+$//g<CR>
set pastetoggle=<F12>

" Temp files: Don't use "." specifically; ends up with these getting checked
" into git all the damn time. Set up some private tempdirs
set directory=~/.vimtmp//
" On macos:
if strlen($TMPDIR) > 0
	set directory+=$TMPDIR//
endif
" On windows:
if strlen($LOCALAPPDATA) > 0
	set directory+=$LOCALAPPDATA\\Temp
endif
set directory+=~/tmp//
" Turn off writing a file backup entirely
set nobackup
set nowritebackup

set updatetime=200 " ms, for things like gitgutter
