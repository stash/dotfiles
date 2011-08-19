set autoindent
set smartindent

" expand tabs to two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" backspace key deletes two spaces
set smarttab

map <F4> :w<CR>:make<CR>:cw<CR>
setlocal makeprg=/usr/local/bin/jslint\ %
setlocal errorformat=%-P%f,
                    \%-G/*jslint\ %.%#*/,
                    \%*[\ ]%n\ %l\\,%c:\ %m,
                    \%-G\ \ \ \ %.%#,
                    \%-GNo\ errors\ found.,
                    \%-Q
map <F3> :w<CR>:!./node_modules/.bin/vows\ %<CR>

