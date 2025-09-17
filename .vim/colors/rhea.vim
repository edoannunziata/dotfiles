" Rhea color theme for Vim.

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='rhea'

" Set the color palette
let s:palette = {
\   'dark_black':   {'rgb': '#2e3440', 'term':  '0'},
\   'dark_red':     {'rgb': '#bf616a', 'term':  '1'},
\   'dark_green':   {'rgb': '#a3be8c', 'term':  '2'},
\   'dark_yellow':  {'rgb': '#ebcb8b', 'term':  '3'},
\   'dark_blue':    {'rgb': '#81a1c1', 'term':  '4'},
\   'dark_purple':  {'rgb': '#b48ead', 'term':  '5'},
\   'dark_cyan':    {'rgb': '#88c0d0', 'term':  '6'},
\   'dark_white':   {'rgb': '#d8dee9', 'term':  '7'},
\   'light_black':  {'rgb': '#4c566a', 'term':  '8'},
\   'light_red':    {'rgb': '#bf616a', 'term':  '9'},
\   'light_green':  {'rgb': '#a3be8c', 'term': '10'},
\   'light_yellow': {'rgb': '#ebcb8b', 'term': '11'},
\   'light_blue':   {'rgb': '#81a1c1', 'term': '12'},
\   'light_purple': {'rgb': '#b48ead', 'term': '13'},
\   'light_cyan':   {'rgb': '#8fbcbb', 'term': '14'},
\   'light_white':  {'rgb': '#eceff4', 'term': '15'}
\}

" Set ANSI colors
let g:terminal_ansi_colors = [
\ s:palette.dark_black.rgb,
\ s:palette.dark_red.rgb,
\ s:palette.dark_green.rgb,
\ s:palette.dark_yellow.rgb,
\ s:palette.dark_blue.rgb,
\ s:palette.dark_purple.rgb,
\ s:palette.dark_cyan.rgb,
\ s:palette.dark_white.rgb,
\ s:palette.light_black.rgb,
\ s:palette.light_red.rgb,
\ s:palette.light_green.rgb,
\ s:palette.light_yellow.rgb,
\ s:palette.light_blue.rgb,
\ s:palette.light_purple.rgb,
\ s:palette.light_cyan.rgb,
\ s:palette.light_white.rgb,
\]

" Set the actual colors, depending on background
let s:t_light_black    = {'gui': s:palette.light_black['rgb'], 'cterm': s:palette.light_black['term']}
let s:t_light_cyan     = {'gui': s:palette.light_cyan['rgb'], 'cterm': s:palette.light_cyan['term']}
let s:t_light_yellow   = {'gui': s:palette.light_yellow['rgb'], 'cterm': s:palette.light_yellow['term']}
let s:t_light_purple   = {'gui': s:palette.light_purple['rgb'], 'cterm': s:palette.light_purple['term']}
let s:t_light_green    = {'gui': s:palette.light_green['rgb'], 'cterm': s:palette.light_green['term']}
let s:t_light_red      = {'gui': s:palette.light_red['rgb'], 'cterm': s:palette.light_red['term']}
let s:t_light_blue     = {'gui': s:palette.light_blue['rgb'], 'cterm': s:palette.light_blue['term']}
let s:t_light_white    = {'gui': s:palette.light_white['rgb'], 'cterm': s:palette.light_white['term']}

let s:t_dark_black     = {'gui': s:palette.dark_black['rgb'], 'cterm': s:palette.dark_black['term']}
let s:t_dark_cyan      = {'gui': s:palette.dark_cyan['rgb'], 'cterm': s:palette.dark_cyan['term']}
let s:t_dark_yellow    = {'gui': s:palette.dark_yellow['rgb'], 'cterm': s:palette.dark_yellow['term']}
let s:t_dark_purple    = {'gui': s:palette.dark_purple['rgb'], 'cterm': s:palette.dark_purple['term']}
let s:t_dark_green     = {'gui': s:palette.dark_green['rgb'], 'cterm': s:palette.dark_green['term']}
let s:t_dark_red       = {'gui': s:palette.dark_red['rgb'], 'cterm': s:palette.dark_red['term']}
let s:t_dark_blue      = {'gui': s:palette.dark_blue['rgb'], 'cterm': s:palette.dark_blue['term']}
let s:t_dark_white     = {'gui': s:palette.dark_white['rgb'], 'cterm': s:palette.dark_white['term']}

if &background == 'dark'
    let s:bg              = {'gui': s:t_dark_black.gui, 'cterm': "NONE"}
    let s:bg_subtle       = s:t_light_black
    let s:fg              = s:t_light_white
    let s:norm            = s:t_dark_white
    let s:light           = s:t_light_black

    let s:visual_bg       = s:t_dark_white
    let s:visual_fg       = s:t_dark_black

    let s:yellow          = s:t_light_yellow
    let s:purple          = s:t_light_purple
    let s:green           = s:t_light_green
    let s:red             = s:t_light_red
    let s:blue            = s:t_light_blue

    let s:accent          = s:t_light_cyan

    execute "hi Terminal guibg=" s:bg.gui
    execute "hi Terminal guifg=" s:norm.gui
else
    let s:bg              = {'gui': s:t_light_white.gui, "cterm": "NONE"}
    let s:bg_subtle       = s:t_dark_white
    let s:fg              = s:t_dark_black
    let s:norm            = s:t_light_black
    let s:light           = s:t_dark_white

    let s:visual_bg       = s:t_light_black
    let s:visual_fg       = s:t_light_white

    let s:yellow          = s:t_dark_yellow
    let s:purple          = s:t_dark_purple
    let s:green           = s:t_dark_green
    let s:red             = s:t_dark_red
    let s:blue            = s:t_dark_blue

    let s:accent          = s:t_dark_cyan

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

call s:h("Constant",      {"fg": s:accent})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

call s:h("Identifier",    {"fg": s:fg, "cterm": s:italic, "gui": s:italic})

call s:h("Function",      {"fg": s:fg, "cterm": s:bold.s:italic, "gui": s:bold.s:italic})

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

call s:h("Type",          {"fg": s:fg})
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
call s:h("Error",         {"fg": s:bg_subtle, "bg": s:red, "cterm": s:bold, "gui": s:bold})
call s:h("Todo",          {"fg": s:purple, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:green})
call s:h("NonText",       {"fg": s:light})
call s:h("Directory",     {"fg": s:norm, "gui": s:bold, "cterm": s:bold})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:accent, "fg": s:t_light_black})
call s:h("Search",        {"bg": s:norm, "fg": s:bg, "cterm": s:bold, "gui": s:bold})
call s:h("MoreMsg",       {"fg": s:light, "cterm": s:bold, "gui": s:bold})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:light})
call s:h("CursorLineNr",  {"fg": s:fg, "bg": s:bg_subtle, "cterm": s:bold, "gui": s:bold})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_subtle, "fg": s:light})
call s:h("VertSplit",     {"bg": s:bg_subtle, "fg": s:bg_subtle})
call s:h("Title",         {"fg": s:light})
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

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:t_light_black, "bg": s:accent})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLineSel",    {"fg": s:t_light_black, "bg": s:accent, "gui": s:bold, "cterm": s:bold})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_subtle})
call s:h("CursorColumn",  {"bg": s:bg_subtle})
call s:h("CursorLine",    {"bg": s:bg_subtle})
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
call s:h("SyntasticWarning",        {"bg": s:yellow, "fg": s:norm, "gui": s:bold, "cterm": s:bold })
call s:h("SyntasticErrorSign",      {"fg": s:red})
call s:h("SyntasticError",          {"bg": s:red, "fg": s:light, "gui": s:bold, "cterm": s:bold})

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
call s:h("markdownId", { "fg": s:light })
call s:h("markdownBlockquote", { "fg": s:light })
call s:h("markdownItalic", { "fg": s:light, "gui": s:italic, "cterm": s:italic })
call s:h("mkdBold", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("mkdInlineURL", { "fg": s:fg, "gui": s:italic, "cterm": s:italic })
call s:h("mkdListItem", { "fg": s:fg })
call s:h("markdownOrderedListMarker", { "fg": s:fg })
call s:h("mkdLink", { "fg": s:fg, "gui": s:bold, "cterm": s:bold })
call s:h("markdownLinkDelimiter", { "fg": s:fg })
call s:h("mkdURL", { "fg": s:accent, "gui": s:italic, "cterm": s:italic })
