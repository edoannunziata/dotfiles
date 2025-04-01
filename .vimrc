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
    set guicursor=i-n-v-c:block-Cursor
    if system('uname') =~ 'Darwin'
        set macligatures
        set guifont=CascadiaCode-Regular:h13
    elseif system('uname') =~ 'Linux'
        set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
        set guifont=Cascadia\ Code\ 13
    else
        set guifont=Cascadia\ Code\ 13
    endif
endif

" ALE options
set signcolumn=number
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
" let g:ale_floating_preview = 1
" let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
set omnifunc=ale#completion#OmniFunc
set completeopt=menuone,noselect
nnoremap K <cmd>ALEHover<CR>
nnoremap <leader>gd <cmd>ALEGoToDefinition<CR>
nnoremap <leader>gr <cmd>ALEFindReferences<CR>
nnoremap <leader>ca <cmd>ALECodeAction<CR>

let g:ale_linters = {
\   'python': ['pylsp', 'jedils'],
\   'c': ['clangd'],
\   'cpp': ['clangd']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format']
\}

" Python
let g:ale_python_auto_virtualenv = 1

" C++
autocmd BufRead,BufNewFile *.h set filetype=cpp
let g:ale_c_cc_options = '-std=c23 -Wall -Wextra -Weffc -Wsign-conversion'
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra -Weffc++ -Wsign-conversion'
let g:ale_cpp_build_dir_names = ['.', 'build', 'bin']
let g:ale_cpp_parse_compile_commands = 1
let g:ale_cpp_clang_use_compile_commands_json = 1
let g:ale_cpp_clangd_use_compile_commands_json = 1
let g:ale_c_clangformat_options = '--style="{BasedOnStyle: WebKit, IndentWidth: 4}"'

" Use tab completion in menus
set wildmenu
set wildmode=list:longest

" Attempts to guess the background
function DetectColorMode()
    if system('uname') =~ 'Darwin'
        let l:command = 'defaults read -g AppleInterfaceStyle'
        let l:dark = 'Dark'
    elseif system('uname') =~ 'Linux'
        let l:command = 'gsettings get org.gnome.desktop.interface color-scheme'
        let l:dark = '-dark'
    endif

    if system(l:command) =~ l:dark
        set background=dark
    else
        set background=light
    endif
endfunction

" Syntax coloring
syntax on
call DetectColorMode()
color rhea
