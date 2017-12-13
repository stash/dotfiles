call pathogen#infect() " load bundles
call pathogen#helptags()

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_baloons=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1 " open automatically when errors, closed when none; default 2
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=3

let g:syntastic_filetype_map = {
    \ "javascript.jsx": "javascript",
    \ }
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_java_checkstyle_classpath = "~/.m2/repository/com/puppycrawl/tools/checkstyle/5.6/checkstyle-5.6.jar"
let g:syntastic_java_checkstyle_conf_file = "./checkstyle.xml"
let g:syntastic_cpp_check_header = 1

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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* " reset syntax
set statusline+=<
set statusline+=\  " one space
set statusline+={0x%B} " hex of character under cursor
set statusline+=\  " one space
set statusline+=%l:%c

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

map <F3> :grep <C-R><C-W><CR><CR>
map <F4> :w<CR>:make<CR>:cw<CR>
map <F5> :SyntasticToggleMode<CR>:redraw!<CR>
map <F6> :%s/ \+$//g<CR>
" map <F7> :call ToggleJSHint()<CR>
set pastetoggle=<F12>

" don't use the default snippets
let g:snippets_dir = "~/.vim/snippets"

command! -complete=shellcmd -nargs=+ GitSplit call s:RunShellCommand('git show '.<q-args>)
function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal bufhidden=wipe nobuflisted noswapfile nowrap
    execute '$read !'. expanded_cmdline
    setlocal nomodifiable
    set filetype=javascript
    1
endfunction

let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1 " width of the guide

set directory=~/.vimtmp//,~/tmp//,/tmp/vim-$USER//

set updatetime=200 " ms, for things like gitgutter
