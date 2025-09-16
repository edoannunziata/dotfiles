hi clear
syntax reset
let colors_name = "simple"

if &background == "light"
  hi LineNr       ctermfg=7
  hi CursorLineNr ctermfg=8
  hi Comment      ctermfg=7
  hi ColorColumn  ctermfg=8    ctermbg=7
  hi Folded       ctermfg=8    ctermbg=7
  hi FoldColumn   ctermfg=8    ctermbg=7
  hi Pmenu        ctermfg=0    ctermbg=7
  hi PmenuSel     ctermfg=7    ctermbg=0
  hi SpellCap     ctermfg=8    ctermbg=7
  hi StatusLine   ctermfg=0    ctermbg=7    cterm=bold
  hi StatusLineNC ctermfg=8    ctermbg=7    cterm=NONE
  hi VertSplit    ctermfg=8    ctermbg=7    cterm=NONE
  hi SignColumn                ctermbg=7
else
  hi LineNr       ctermfg=8
  hi CursorLineNr ctermfg=7
  hi Comment      ctermfg=8
  hi ColorColumn  ctermfg=7    ctermbg=8
  hi Folded       ctermfg=7    ctermbg=8
  hi FoldColumn   ctermfg=7    ctermbg=8
  hi Pmenu        ctermfg=15   ctermbg=8
  hi PmenuSel     ctermfg=8    ctermbg=15
  hi SpellCap     ctermfg=7    ctermbg=8
  hi StatusLine   ctermfg=15   ctermbg=8    cterm=bold
  hi StatusLineNC ctermfg=7    ctermbg=8    cterm=NONE
  hi VertSplit    ctermfg=7    ctermbg=8    cterm=NONE
  hi SignColumn                ctermbg=8
endif
