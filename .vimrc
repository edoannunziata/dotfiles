syntax on

set tabstop=4
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

set nohlsearch

set number
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
set signcolumn=number

set wildmenu
set wildmode=list:longest

set background=dark
color komau
hi Normal guibg=NONE ctermbg=NONE

nnoremap <c-j> <c-w>j
nnoremap <c-J> <c-w>J
nnoremap <c-k> <c-w>k
nnoremap <c-K> <c-w>K
nnoremap <c-h> <c-w>h
nnoremap <c-H> <c-w>H
nnoremap <c-l> <c-w>l
nnoremap <c-L> <c-w>L
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif


