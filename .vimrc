" Basic editor functionality
set number
set tabstop=4
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on
set cursorline
set laststatus=1

" GUI Options
if has('gui_running') 
    set guioptions -=m
    set guioptions -=T
    set guioptions -=r
    set guioptions -=L
    set guioptions -=b
    set guioptions -=u
    set guifont=InputMono-Regular:h13
    set guicursor=i-n-v-c:block-Cursor
endif

" Do not highlight search results
set nohlsearch

" ALE options
set signcolumn=number
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menuone,noselect
nnoremap K <cmd>ALEHover<CR>
nnoremap <leader>gd <cmd>ALEGoToDefinition<CR>
nnoremap <leader>gr <cmd>ALEFindReferences<CR>
nnoremap <leader>ca <cmd>ALECodeAction<CR>

let g:ale_pattern_options = {
    \ '\.py$': {'ale_linters': ['pyright'], 'ale_fixers': ['black'], 'filetype': 'py'},
    \ '\.h$': {'ale_linters': ['clangd', 'clangtidy'], 'ale_fixers': ['clang-format'], 'filetype': 'cpp'},
    \ '\.cpp$': {'ale_linters': ['clangd', 'clangtidy'], 'ale_fixers': ['clang-format'], 'filetype': 'cpp'},
\}

" C++
autocmd BufRead,BufNewFile *.h set filetype=cpp
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra -Weffc++ -Wsign-conversion'
let g:ale_c_build_dir_names = ['.', 'build', 'bin']
let g:ale_cpp_build_dir_names = ['.', 'build', 'bin']
let g:ale_c_parse_compile_commands = 1
let g:ale_cpp_parse_compile_commands = 1
let g:ale_cpp_clang_use_compile_commands_json = 1
let g:ale_cpp_clangd_use_compile_commands_json = 1
let g:ale_c_clangformat_options = '--style="{BasedOnStyle: WebKit, IndentWidth: 4}"'

" Use tab completion in menus
set wildmenu
set wildmode=list:longest

" Syntax coloring
syntax on
if system('uname') =~ 'Darwin'
    if system('defaults read -g AppleInterfaceStyle') =~ 'Dark'
        set background=dark
    else
        set background=light
    endif
else
    set background=dark
endif
color komau
if !has('gui_running')
    hi Normal ctermbg=None
endif

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

