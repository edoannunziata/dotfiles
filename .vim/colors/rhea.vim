" Rhea color theme for Vim.

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='rhea'

" Set the color palette
let s:palette = {
\   'dark_red':     {'rgb': '#d70000', 'fb256': '160', 'fb16':  '1', 'fb8': '1'},
\   'dark_green':   {'rgb': '#00af00', 'fb256':  '34', 'fb16':  '2', 'fb8': '2'},
\   'dark_yellow':  {'rgb': '#af8700', 'fb256': '136', 'fb16':  '3', 'fb8': '3'},
\   'dark_blue':    {'rgb': '#005fd7', 'fb256':  '26', 'fb16':  '4', 'fb8': '4'},
\   'dark_purple':  {'rgb': '#8700af', 'fb256':  '91', 'fb16':  '5', 'fb8': '5'},
\   'dark_cyan':    {'rgb': '#5fafd7', 'fb256':  '74', 'fb16':  '6', 'fb8': '6'},
\   'light_red':    {'rgb': '#d75f5f', 'fb256': '167', 'fb16':  '9', 'fb8': '1'},
\   'light_green':  {'rgb': '#00d700', 'fb256':  '40', 'fb16': '10', 'fb8': '2'},
\   'light_yellow': {'rgb': '#ffffaf', 'fb256': '229', 'fb16': '11', 'fb8': '3'},
\   'light_blue':   {'rgb': '#5f87ff', 'fb256':  '69', 'fb16': '12', 'fb8': '4'},
\   'light_purple': {'rgb': '#af0087', 'fb256': '126', 'fb16': '13', 'fb8': '5'},
\   'light_cyan':   {'rgb': '#5fd7d7', 'fb256':  '80', 'fb16': '14', 'fb8': '6'},
\   'gray_0':       {'rgb': '#121212', 'fb256': '233', 'fb16':  '0', 'fb8': '0'},
\   'gray_1':       {'rgb': '#303030', 'fb256': '236', 'fb16':  '8', 'fb8': '0'},
\   'gray_2':       {'rgb': '#444444', 'fb256': '238', 'fb16':  '8', 'fb8': '0'},
\   'gray_3':       {'rgb': '#585858', 'fb256': '240', 'fb16':  '8', 'fb8': '0'},
\   'gray_4':       {'rgb': '#999999', 'fb256': '246', 'fb16':  '7', 'fb8': '7'},
\   'gray_5':       {'rgb': '#cccccc', 'fb256': '252', 'fb16':  '7', 'fb8': '7'},
\   'gray_6':       {'rgb': '#e5e5e5', 'fb256': '254', 'fb16':  '7', 'fb8': '7'},
\   'gray_7':       {'rgb': '#ffffff', 'fb256': '231', 'fb16': '15', 'fb8': '7'}
\}

" Set ANSI colors
let g:terminal_ansi_colors = [
\ s:palette.gray_0.rgb,
\ s:palette.dark_red.rgb,
\ s:palette.dark_green.rgb,
\ s:palette.dark_yellow.rgb,
\ s:palette.dark_blue.rgb,
\ s:palette.dark_purple.rgb,
\ s:palette.dark_cyan.rgb,
\ s:palette.gray_5.rgb,
\ s:palette.gray_2.rgb,
\ s:palette.light_red.rgb,
\ s:palette.light_green.rgb,
\ s:palette.light_yellow.rgb,
\ s:palette.light_blue.rgb,
\ s:palette.light_purple.rgb,
\ s:palette.light_cyan.rgb,
\ s:palette.gray_7.rgb,
\]

" Determine what fallback level to use, if any
function! DetermineFallbackLevel()
    let l:rhea_fallback =  get(g:, 'rhea_fallback', '')
    if has('gui_running') || &t_Co >= 256 || &t_Co == '' || l:rhea_fallback == 256
        let s:col = 'fb256'
    elseif &t_Co >= 16 || l_rhea_fallback = 16
        let s:col = 'fb16'
    else
        let s:col = 'fb8'
    endif
endfunction
call DetermineFallbackLevel()

" Set the actual colors, depending on background
let s:t_black          = {'gui': s:palette.gray_0['rgb'], 'cterm': s:palette.gray_0[s:col]}
let s:t_subtle_black   = {'gui': s:palette.gray_1['rgb'], 'cterm': s:palette.gray_1[s:col]}
let s:t_light_black    = {'gui': s:palette.gray_2['rgb'], 'cterm': s:palette.gray_2[s:col]}
let s:t_lighter_black  = {'gui': s:palette.gray_3['rgb'], 'cterm': s:palette.gray_3[s:col]}
let s:t_light_gray     = {'gui': s:palette.gray_4['rgb'], 'cterm': s:palette.gray_4[s:col]}
let s:t_lighter_gray   = {'gui': s:palette.gray_5['rgb'], 'cterm': s:palette.gray_5[s:col]}
let s:t_lightest_gray  = {'gui': s:palette.gray_6['rgb'], 'cterm': s:palette.gray_6[s:col]}
let s:t_white          = {'gui': s:palette.gray_7['rgb'], 'cterm': s:palette.gray_7[s:col]}
let s:t_light_cyan     = {'gui': s:palette.light_cyan['rgb'], 'cterm': s:palette.light_cyan[s:col]}
let s:t_light_yellow   = {'gui': s:palette.light_yellow['rgb'], 'cterm': s:palette.light_yellow[s:col]}
let s:t_light_purple   = {'gui': s:palette.light_purple['rgb'], 'cterm': s:palette.light_purple[s:col]}
let s:t_light_green    = {'gui': s:palette.light_green['rgb'], 'cterm': s:palette.light_green[s:col]}
let s:t_light_red      = {'gui': s:palette.light_red['rgb'], 'cterm': s:palette.light_red[s:col]}
let s:t_light_blue     = {'gui': s:palette.light_blue['rgb'], 'cterm': s:palette.light_blue[s:col]}
let s:t_dark_cyan      = {'gui': s:palette.dark_cyan['rgb'], 'cterm': s:palette.dark_cyan[s:col]}
let s:t_dark_yellow    = {'gui': s:palette.dark_yellow['rgb'], 'cterm': s:palette.dark_yellow[s:col]}
let s:t_dark_purple    = {'gui': s:palette.dark_purple['rgb'], 'cterm': s:palette.dark_purple[s:col]}
let s:t_dark_green     = {'gui': s:palette.dark_green['rgb'], 'cterm': s:palette.dark_green[s:col]}
let s:t_dark_red       = {'gui': s:palette.dark_red['rgb'], 'cterm': s:palette.dark_red[s:col]}
let s:t_dark_blue      = {'gui': s:palette.dark_blue['rgb'], 'cterm': s:palette.dark_blue[s:col]}

if &background == 'dark'
    let s:bg              = {'gui': s:t_black.gui, 'cterm': "NONE"}
    let s:bg_very_subtle  = s:t_subtle_black
    let s:bg_subtle       = s:t_lighter_black

    let s:fg              = s:t_white
    let s:norm            = s:t_lighter_gray

    if s:col == 'fb256'
        let s:light       = s:t_lighter_black
        let s:visual_bg   = s:t_subtle_black
        let s:visual_fg   = s:norm
    else
        let s:light       = s:t_light_gray
        let s:visual_bg   = s:t_lighter_gray
        let s:visual_fg   = s:t_black
    endif

    let s:cyan            = s:t_light_cyan
    let s:yellow          = s:t_light_yellow
    let s:purple          = s:t_light_purple
    let s:green           = s:t_light_green
    let s:red             = s:t_light_red
    let s:blue            = s:t_light_blue

    execute "hi Terminal guibg=" s:bg.gui
    execute "hi Terminal guifg=" s:norm.gui
else
    let s:bg              = {'gui': s:t_white.gui, "cterm": "NONE"}
    let s:bg_very_subtle  = s:t_lightest_gray
    let s:bg_subtle       = s:t_light_gray

    let s:fg              = s:t_black
    let s:norm            = s:t_light_black

    if s:col == 'fb256'
        let s:light       = s:t_light_gray
        let s:visual_bg   = s:t_lightest_gray
        let s:visual_fg   = s:norm
    else
        let s:light       = s:t_light_black
        let s:visual_bg   = s:t_light_black
        let s:visual_fg   = s:t_white
    endif

    let s:cyan            = s:t_dark_cyan
    let s:yellow          = s:t_dark_yellow
    let s:purple          = s:t_dark_purple
    let s:green           = s:t_dark_green
    let s:red             = s:t_dark_red
    let s:blue            = s:t_dark_blue

    execute "hi Terminal guibg=" s:bg.gui
    execute "hi Terminal guifg=" s:norm.gui
endif

" Can we use bold?
if ((get(g:, 'rhea_bold', 1)) || &t_Co >= 256 || has('gui_running'))
    let s:bold = "BOLD"
else
    let s:bold = "NONE"
endif

" Can we use italic?
if ((get(g:, 'rhea_italic', 0)) || &t_Co >= 256 || has('gui_running'))
    let s:italic = "ITALIC"
else
    let s:italic = "NONE"
endif

" Syntax highlighting generator
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" --------------------------------------------------------------- "

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})

call s:h("Cursor",        {"bg": s:light, "fg": s:norm })
call s:h("Comment",       {"fg": s:light, "cterm": s:italic, "gui": s:italic})

call s:h("Constant",      {"fg": s:cyan})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

call s:h("Identifier",    {"fg": s:fg, "cterm": s:italic, "gui": s:italic})
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:fg, "cterm": s:bold, "gui": s:bold})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:fg, "cterm": s:bold, "gui": s:bold})

call s:h("PreProc",       {"fg": s:norm, "cterm": s:bold, "gui": s:bold})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:t_white, "bg": s:red, "cterm": s:bold, "gui": s:bold})
call s:h("Todo",          {"fg": s:purple, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:green})
call s:h("NonText",       {"fg": s:light})
call s:h("Directory",     {"fg": s:norm, "gui": s:bold, "cterm": s:bold})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:cyan, "fg": s:t_subtle_black})
call s:h("Search",        {"bg": s:norm, "fg": s:bg, "cterm": s:bold, "gui": s:bold})
call s:h("MoreMsg",       {"fg": s:light, "cterm": s:bold, "gui": s:bold})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_very_subtle})
call s:h("CursorLineNr",  {"fg": s:fg, "bg": s:bg_very_subtle, "cterm": s:bold, "gui": s:bold})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:light})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:t_light_gray})
call s:h("Visual",        {"fg": s:visual_fg, "bg": s:visual_bg})
call s:h("VisualNOS",     {"bg": s:visual_bg})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:light})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:yellow})
call s:h("DiffText",      {"fg": s:blue})
call s:h("SignColumn",    {"fg": s:green})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:red})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:yellow})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:yellow})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:green})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:yellow})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:yellow})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:green})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("PmenuSel",      {"fg": s:t_subtle_black, "bg": s:cyan})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:t_subtle_black, "bg": s:cyan, "gui": s:bold, "cterm": s:bold})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:light})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" Syntastic
call s:h("SyntasticWarningSign",    {"fg": s:yellow})
call s:h("SyntasticWarning",        {"bg": s:yellow, "fg": s:t_black, "gui": s:bold, "cterm": s:bold })
call s:h("SyntasticErrorSign",      {"fg": s:red})
call s:h("SyntasticError",          {"bg": s:red, "fg": s:t_white, "gui": s:bold, "cterm": s:bold})

" Neomake
hi link NeomakeWarningSign	SyntasticWarningSign
hi link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi link ALEWarningSign	SyntasticWarningSign
hi link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

" Markdown
call s:h("markdownCode", { "fg": s:light })
call s:h("markdownLinkReference", { "fg": s:light })
call s:h("markdownJekyllFrontMatter", { "fg": s:light })
call s:h("markdownCodeBlock", { "fg": s:norm })
call s:h("markdownCodeDelimiter", { "fg": s:norm })
call s:h("markdownHeadingDelimiter", { "fg": s:fg })
call s:h("markdownRule", { "fg": s:light })
call s:h("markdownHeadingRule", { "fg": s:light })
call s:h("htmlH1", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("htmlH2", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("htmlH3", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("htmlH4", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("htmlH5", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("htmlH6", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("mkdDelimiter", { "fg": s:fg })
call s:h("markdownId", { "fg": s:t_light_gray })
call s:h("markdownBlockquote", { "fg": s:light })
call s:h("markdownItalic", { "fg": s:t_light_gray, "gui": s:italic, "cterm": s:italic })
call s:h("mkdBold", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("mkdInlineURL", { "fg": s:fg, "gui": s:italic, "cterm": s:italic })
call s:h("mkdListItem", { "fg": s:fg })
call s:h("markdownOrderedListMarker", { "fg": s:fg })
call s:h("mkdLink", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("markdownLinkDelimiter", { "fg": s:fg })
call s:h("mkdURL", { "fg": s:cyan, "gui": s:italic, "cterm": s:italic })
