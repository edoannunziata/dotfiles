" Disable POSIX compatibility
set nocompatible

" Basic editor functionality
set number
set tabstop=4
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on
set laststatus=1
set shortmess+=I
set nohlsearch
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" F5 tries to run the file
function g:RunCurrentFile()
    if &filetype =~ 'vim'
        :source %
    elseif &filetype =~ 'python'
        :!python3 %
    endif
endfunction

nnoremap <f5> :w <CR>:call g:RunCurrentFile()<CR>

" GUI Options
if has('gui_running') 
    set guioptions -=m
    set guioptions -=T
    set guioptions -=r
    set guioptions -=L
    set guioptions -=b
    set guioptions -=u
    set guifont=Cascadia\ Code\ 13
    set guicursor=i-n-v-c:block-Cursor
    if system('uname') =~ 'Darwin'
        set macligatures
    endif
    set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
endif

" ALE options
set signcolumn=number
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
set omnifunc=ale#completion#OmniFunc
set completeopt=menuone,noselect
nnoremap K <cmd>ALEHover<CR>
nnoremap <leader>gd <cmd>ALEGoToDefinition<CR>
nnoremap <leader>gr <cmd>ALEFindReferences<CR>
nnoremap <leader>ca <cmd>ALECodeAction<CR>

let g:ale_pattern_options = {
    \ '\.py$': {
    \       'ale_linters': ['pylsp'], 
    \       'ale_fixers': ['black'], 
    \       'filetype': 'py'
    \ },
    \ '\.h$': {
    \       'ale_linters': ['clangd', 'clangtidy'], 
    \       'ale_fixers': ['clang-format'], 
    \       'filetype': 'cpp'
    \ },
    \ '\.cpp$': {
    \       'ale_linters': ['clangd', 'clangtidy'], 
    \       'ale_fixers': ['clang-format'], 
    \       'filetype': 'cpp'
    \ },
\}

" Python
let g:ale_python_auto_virtualenv = 1

" C++
autocmd BufRead,BufNewFile *.h set filetype=cpp
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra -Weffc++ -Wsign-conversion'
let g:ale_cpp_build_dir_names = ['.', 'build', 'bin']
let g:ale_cpp_parse_compile_commands = 1
let g:ale_cpp_clang_use_compile_commands_json = 1
let g:ale_cpp_clangd_use_compile_commands_json = 1
let g:ale_c_clangformat_options = '--style="{BasedOnStyle: WebKit, IndentWidth: 4}"'

" Use tab completion in menus
set wildmenu
set wildmode=list:longest

" Syntax coloring
syntax on
color rhea

