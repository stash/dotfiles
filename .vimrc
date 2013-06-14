call pathogen#infect() " load bundles
call pathogen#helptags()

let g:syntastic_check_on_open=1
let g:syntastic_enable_baloons=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1 " open automatically when errors, closed when none; default 2
let g:syntastic_loc_list_height=3

" disable ex mode
nnoremap Q <nop>

if &t_Co > 2 || has('gui_running') " color terminal
  syntax on
  syntax sync fromstart
  set hlsearch " Highlight matches.
else
  syntax off
endif

if &t_Co > 88 || has('gui_running')
  set background=dark
  colorscheme stash
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

" shows linenumbers relative to your cursor position
" set relativenumber

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

" https://github.com/goinstant/slashjoin/wiki/vim-strip-whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" thanks @bendecoste for most of this:

" use global .jshint by default
let g:syntastic_javascript_jshint_conf = "~/.jshintrc"

function! ToggleJSHint()
  if !exists('b:syntastic_javascript_jshint_conf')
    let b:syntastic_javascript_jshint_conf = g:syntastic_javascript_jshint_conf
  endif

  " cycles shared -> browser -> node -> shared ...
  if b:syntastic_javascript_jshint_conf == ".jshintrc.shared"
    let b:syntastic_javascript_jshint_conf = ".jshintrc.browser"
  elseif b:syntastic_javascript_jshint_conf == ".jshintrc.browser"
    let b:syntastic_javascript_jshint_conf = ".jshintrc.node"
  elseif b:syntastic_javascript_jshint_conf == ".jshintrc.node"
    let b:syntastic_javascript_jshint_conf = ".jshintrc.jasmine"
  else
    " toggling starts here by default
    let b:syntastic_javascript_jshint_conf = ".jshintrc.shared"
  endif
  :SyntasticCheck
  echo "jshint is now using" b:syntastic_javascript_jshint_conf
endfunc

map <F3> :grep <C-R><C-W><CR><CR>
map <F4> :w<CR>:make<CR>:cw<CR>
map <F5> :SyntasticToggleMode<CR>:redraw!<CR>
map <F6> :%s/ \+$//g<CR>
map <F7> :call ToggleJSHint()<CR>
