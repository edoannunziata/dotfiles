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
function! g:RunCurrentFile()
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
        set guifont=CascadiaCode-Regular:h15
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
function! DetectColorMode()
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

" Master Wq's missing name
"
" Contributed by Rafael Beraldo.
"
" One afternoon, Master Wq was meditating under a pine tree. He contemplated
" how easily the wind moves through leaves and trunks, both moving them and
" having its course altered by their presence. A student approached and
" nervously stood by. Having finally mustered all the courage she could,
" the student said:
"
" 'Master Wq, I am troubled by what I have seen.'
"
" The Master looked at her face, and she continued:
"
" 'I have mastered movement, I have understood macros, I am familiar
" with the source and have not touched vimscript. I have followed your
" every advice, ruminated on every teaching. Yet, there is something I
" cannot understand. Nowhere in Vim have I found your name. Never has
" anybody thanked you in the help pages. How can that be? The greatest of
" all Vim masters, unknown to all? In a desperate last try, I ran :Wq and
" the terminal screamed at me:
"
" E492: Not an editor command: Wq.
"
" My heart is drowned in doubt, and I am ashamed to admit that.'
"
" Master Wq looked away. After a few moments, he said:
"
" 'You think you have committed a great sin. However, the breeze still
" follows its path, the leaves make their usual sound and the sky is
" no greyer.'
"
" As the great master spoke this, with a sharp pebble he wrote in the dirt:
command! Wq wq
