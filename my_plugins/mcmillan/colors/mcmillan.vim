" Vim color file --- Solarized (Adapted from Peaksea structure)
" Maintainer: Randy McMillan / Adapted for Solarized workflow
" Description: Clean, native-style Solarized color scheme supporting GUI and 256-color terminals.

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "solarized"

if &background=='light' 
  " =========================================================================
  " LIGHT BACKGROUND CONFIGURATION
  " =========================================================================

  hi Normal		guifg=#657b83	guibg=#fdf6e3	gui=NONE
  hi Search		guifg=#fdf6e3	guibg=#cb4b16	gui=NONE
  hi Visual		guifg=NONE	guibg=#eee8d5	gui=NONE
  hi Cursor		guifg=#fdf6e3	guibg=#268bd2	gui=NONE
  hi Special		guifg=#b58900	guibg=NONE	gui=NONE
  hi Comment		guifg=#93a1a1	guibg=NONE	gui=italic
  hi Number		guifg=#cb4b16	guibg=NONE	gui=NONE
  hi Constant		guifg=#2aa198	guibg=NONE	gui=NONE
  hi StatusLine		guifg=#657b83	guibg=#eee8d5	gui=NONE
  hi LineNr		guifg=#93a1a1	guibg=#eee8d5	gui=NONE
  hi Question		guifg=#268bd2	guibg=NONE	gui=bold
  hi PreProc		guifg=#cb4b16	guibg=NONE	gui=NONE
  hi Statement		guifg=#859900	guibg=NONE	gui=NONE
  hi Type		guifg=#b58900	guibg=NONE	gui=NONE
  hi Todo		guifg=#dc322f	guibg=#eee8d5	gui=bold
  hi Error		guifg=#dc322f	guibg=NONE	gui=bold
  hi Identifier		guifg=#268bd2	guibg=NONE	gui=NONE
  hi ModeMsg		guifg=#268bd2	guibg=NONE	gui=bold
  hi VisualNOS		guifg=NONE	guibg=#eee8d5	gui=NONE
  hi SpecialKey		guifg=#cb4b16	guibg=NONE	gui=NONE
  hi NonText		guifg=#93a1a1	guibg=#eee8d5	gui=NONE
  hi Directory		guifg=#268bd2	guibg=NONE	gui=NONE
  hi ErrorMsg		guifg=#fdf6e3	guibg=#dc322f	gui=NONE
  hi MoreMsg		guifg=#268bd2	guibg=NONE	gui=NONE
  hi Title		guifg=#cb4b16	guibg=NONE	gui=bold
  hi WarningMsg		guifg=#cb4b16	guibg=NONE	gui=bold
  hi WildMenu		guifg=#657b83	guibg=#eee8d5	gui=bold
  hi Folded		guifg=#93a1a1	guibg=#eee8d5	gui=NONE
  hi FoldColumn		guifg=#93a1a1	guibg=#eee8d5	gui=NONE
  hi DiffAdd		guifg=#859900	guibg=#eee8d5	gui=NONE
  hi DiffChange		guifg=#b58900	guibg=#eee8d5	gui=NONE
  hi DiffDelete		guifg=#dc322f	guibg=#eee8d5	gui=NONE
  hi DiffText		guifg=#268bd2	guibg=#eee8d5	gui=NONE
  hi SignColumn		guifg=#93a1a1	guibg=#eee8d5	gui=NONE

  hi IncSearch		guifg=#fdf6e3	guibg=#cb4b16	gui=NONE
  hi StatusLineNC	guifg=#93a1a1	guibg=#eee8d5	gui=NONE
  hi VertSplit		guifg=#93a1a1	guibg=#eee8d5	gui=NONE
  hi Underlined		guifg=#6c71c4	guibg=NONE	gui=underline
  hi Ignore		guifg=#eee8d5	guibg=NONE

  if v:version >= 700
    if has('spell')
      hi SpellBad	guifg=NONE	guibg=NONE	guisp=#dc322f
      hi SpellCap	guifg=NONE	guibg=NONE	guisp=#268bd2
      hi SpellRare	guifg=NONE	guibg=NONE	guisp=#d33682
      hi SpellLocal	guifg=NONE	guibg=NONE	guisp=#2aa198
    endif
    hi Pmenu		guifg=#657b83	guibg=#eee8d5	gui=NONE
    hi PmenuSel		guifg=#fdf6e3	guibg=#268bd2	gui=NONE
    hi PmenuSbar	guifg=#657b83	guibg=#93a1a1	gui=NONE
    hi PmenuThumb	guifg=#657b83	guibg=#eee8d5	gui=NONE
    hi TabLine		guifg=#93a1a1	guibg=#eee8d5	gui=NONE
    hi TabLineFill	guifg=#93a1a1	guibg=#eee8d5	gui=NONE
    hi TabLineSel	guifg=#657b83	guibg=#fdf6e3	gui=bold
    hi CursorColumn	guifg=NONE	guibg=#eee8d5	gui=NONE
    hi CursorLine	guifg=NONE	guibg=#eee8d5	gui=NONE
    hi MatchParen	guifg=#fdf6e3	guibg=#b58900	gui=NONE
  endif

  if &t_Co==8 || &t_Co==16
    set t_Co=256
  endif
  
  if &t_Co==256
    hi Normal		ctermfg=66	ctermbg=230	cterm=NONE
    hi Search		ctermfg=230	ctermbg=166	cterm=NONE
    hi Visual		ctermfg=NONE	ctermbg=254	cterm=NONE
    hi Cursor		ctermfg=230	ctermbg=33	cterm=NONE
    hi Special		ctermfg=136	ctermbg=NONE	cterm=NONE
    hi Comment		ctermfg=244	ctermbg=NONE	cterm=NONE
    hi Number		ctermfg=166	ctermbg=NONE	cterm=NONE
    hi Constant		ctermfg=37	ctermbg=NONE	cterm=NONE
    hi StatusLine	ctermfg=66	ctermbg=254	cterm=NONE
    hi LineNr		ctermfg=244	ctermbg=254	cterm=NONE
    hi Question		ctermfg=33	ctermbg=NONE	cterm=bold
    hi PreProc		ctermfg=166	ctermbg=NONE	cterm=NONE
    hi Statement	ctermfg=64	ctermbg=NONE	cterm=NONE
    hi Type		ctermfg=136	ctermbg=NONE	cterm=NONE
    hi Todo		ctermfg=160	ctermbg=254	cterm=bold
    hi Error		ctermfg=160	ctermbg=NONE	cterm=bold
    hi Identifier	ctermfg=33	ctermbg=NONE	cterm=NONE
    hi ModeMsg		ctermfg=33	ctermbg=NONE	cterm=bold
    hi VisualNOS	ctermfg=NONE	ctermbg=254	cterm=NONE
    hi SpecialKey	ctermfg=166	ctermbg=NONE	cterm=NONE
    hi NonText		ctermfg=244	ctermbg=254	cterm=NONE
    hi Directory	ctermfg=33	ctermbg=NONE	cterm=NONE
    hi ErrorMsg		ctermfg=230	ctermbg=160	cterm=NONE
    hi MoreMsg		ctermfg=33	ctermbg=NONE	cterm=NONE
    hi Title		ctermfg=166	ctermbg=NONE	cterm=bold
    hi WarningMsg	ctermfg=166	ctermbg=NONE	cterm=bold
    hi WildMenu		ctermfg=66	ctermbg=254	cterm=bold
    hi Folded		ctermfg=244	ctermbg=254	cterm=NONE
    hi FoldColumn	ctermfg=244	ctermbg=254	cterm=NONE
    hi DiffAdd		ctermfg=64	ctermbg=254	cterm=NONE
    hi DiffChange	ctermfg=136	ctermbg=254	cterm=NONE
    hi DiffDelete	ctermfg=160	ctermbg=254	cterm=NONE
    hi DiffText		ctermfg=33	ctermbg=254	cterm=NONE
    hi SignColumn	ctermfg=244	ctermbg=254	cterm=NONE

    hi IncSearch	ctermfg=230	ctermbg=166	cterm=NONE
    hi StatusLineNC	ctermfg=244	ctermbg=254	cterm=NONE
    hi VertSplit	ctermfg=244	ctermbg=254	cterm=NONE
    hi Underlined	ctermfg=61	ctermbg=NONE	cterm=underline
    hi Ignore		ctermfg=254	ctermbg=NONE

    if v:version >= 700
      if has('spell')
        hi SpellBad	cterm=undercurl	ctermbg=NONE	ctermfg=160
        hi SpellCap	cterm=undercurl	ctermbg=NONE	ctermfg=33
        hi SpellRare	cterm=undercurl	ctermbg=NONE	ctermfg=125
        hi SpellLocal	cterm=undercurl	ctermbg=NONE	ctermfg=37
      endif
      hi Pmenu		ctermfg=66	ctermbg=254	cterm=NONE
      hi PmenuSel	ctermfg=230	ctermbg=33	cterm=NONE
      hi PmenuSbar	ctermfg=66	ctermbg=244	cterm=NONE
      hi PmenuThumb	ctermfg=66	ctermbg=254	cterm=NONE
      hi TabLine	ctermfg=244	ctermbg=254	cterm=NONE
      hi TabLineFill	ctermfg=244	ctermbg=254	cterm=NONE
      hi TabLineSel	ctermfg=66	ctermbg=230	cterm=bold
      hi CursorColumn	ctermfg=NONE	ctermbg=254	cterm=NONE
      hi CursorLine	ctermfg=NONE	ctermbg=254	cterm=NONE
      hi MatchParen	ctermfg=230	ctermbg=136	cterm=NONE
    endif
  endif

elseif &background=='dark' 
  " =========================================================================
  " DARK BACKGROUND CONFIGURATION (Solarized Dark)
  " =========================================================================

  hi Normal		guifg=#839496	guibg=#002b36	gui=NONE
  hi Comment		guifg=#586e75	guibg=NONE	gui=italic
  hi Constant		guifg=#2aa198	guibg=NONE	gui=NONE
  hi Number		guifg=#cb4b16	guibg=NONE	gui=NONE
  hi Identifier		guifg=#268bd2	guibg=NONE	gui=NONE
  hi Statement		guifg=#859900	guibg=NONE	gui=NONE
  hi PreProc		guifg=#cb4b16	guibg=NONE	gui=NONE
  hi Type		guifg=#b58900	guibg=NONE	gui=NONE
  hi Special		guifg=#b58900	guibg=NONE	gui=NONE
  hi Error		guifg=#dc322f	guibg=NONE	gui=bold
  hi Todo		guifg=#dc322f	guibg=#073642	gui=bold
  hi Search		guifg=#002b36	guibg=#b58900	gui=NONE
  hi Visual		guifg=NONE	guibg=#073642	gui=NONE
  hi Cursor		guifg=#002b36	guibg=#839496	gui=NONE
  hi StatusLine		guifg=#839496	guibg=#073642	gui=NONE
  hi LineNr		guifg=#586e75	guibg=#073642	gui=NONE
  hi Question		guifg=#268bd2	guibg=NONE	gui=bold
  hi ModeMsg		guifg=#268bd2	guibg=NONE	gui=bold
  hi VisualNOS		guifg=NONE	guibg=#073642	gui=NONE
  hi SpecialKey		guifg=#cb4b16	guibg=NONE	gui=NONE
  hi NonText		guifg=#586e75	guibg=#073642	gui=NONE
  hi Directory		guifg=#268bd2	guibg=NONE	gui=NONE
  hi ErrorMsg		guifg=#002b36	guibg=#dc322f	gui=NONE
  hi MoreMsg		guifg=#268bd2	guibg=NONE	gui=NONE
  hi Title		guifg=#cb4b16	guibg=NONE	gui=bold
  hi WarningMsg		guifg=#cb4b16	guibg=NONE	gui=bold
  hi WildMenu		guifg=#839496	guibg=#073642	gui=bold
  hi Folded		guifg=#586e75	guibg=#073642	gui=NONE
  hi FoldColumn		guifg=#586e75	guibg=#073642	gui=NONE
  hi DiffAdd		guifg=#859900	guibg=#073642	gui=NONE
  hi DiffChange		guifg=#b58900	guibg=#073642	gui=NONE
  hi DiffDelete		guifg=#dc322f	guibg=#073642	gui=NONE
  hi DiffText		guifg=#268bd2	guibg=#073642	gui=NONE
  hi SignColumn		guifg=#586e75	guibg=#073642	gui=NONE
  hi IncSearch		guifg=#002b36	guibg=#cb4b16	gui=NONE
  hi StatusLineNC	guifg=#586e75	guibg=#073642	gui=NONE
  hi VertSplit		guifg=#586e75	guibg=#073642	gui=NONE
  hi Underlined		guifg=#6c71c4	guibg=NONE	gui=underline 
  hi Ignore		guifg=#002b36	guibg=NONE

  if v:version >= 700
    if has('spell')
      hi SpellBad	guifg=NONE	guibg=NONE	guisp=#dc322f
      hi SpellCap	guifg=NONE	guibg=NONE	guisp=#268bd2
      hi SpellRare	guifg=NONE	guibg=NONE	guisp=#d33682
      hi SpellLocal	guifg=NONE	guibg=NONE	guisp=#2aa198
    endif

    hi Pmenu          guifg=#839496     guibg=#073642     gui=NONE
    hi PmenuSel       guifg=#002b36     guibg=#268bd2     gui=NONE
    hi TabLine		guifg=#586e75	guibg=#073642	gui=NONE
    hi TabLineFill	guifg=#586e75	guibg=#073642	gui=NONE
    hi TabLineSel	guifg=#839496	guibg=#002b36	gui=bold
    hi CursorColumn	guifg=NONE	guibg=#073642	gui=NONE
    hi CursorLine	guifg=NONE	guibg=#073642	gui=NONE
    hi MatchParen	guifg=#002b36	guibg=#b58900	gui=NONE
  endif

  if &t_Co==8 || &t_Co==16
    set t_Co=256
  endif

  if &t_Co==256
    hi Normal		ctermfg=244	ctermbg=234	cterm=NONE
    hi Comment		ctermfg=240	ctermbg=NONE	cterm=NONE
    hi Constant		ctermfg=37	ctermbg=NONE	cterm=NONE
    hi Number		ctermfg=166	ctermbg=NONE	cterm=NONE
    hi Identifier	ctermfg=33	ctermbg=NONE	cterm=NONE
    hi Statement	ctermfg=64	ctermbg=NONE	cterm=NONE
    hi PreProc		ctermfg=166	ctermbg=NONE	cterm=NONE
    hi Type		ctermfg=136	ctermbg=NONE	cterm=NONE
    hi Special		ctermfg=136	ctermbg=NONE	cterm=NONE
    hi Error		ctermfg=160	ctermbg=NONE	cterm=bold
    hi Todo		ctermfg=160	ctermbg=235	cterm=bold
    hi Search		ctermfg=234	ctermbg=136	cterm=NONE
    hi Visual		ctermfg=NONE	ctermbg=235	cterm=NONE
    hi Cursor		ctermfg=234	ctermbg=244	cterm=NONE
    hi StatusLine	ctermfg=244	ctermbg=235	cterm=NONE
    hi LineNr		ctermfg=240	ctermbg=235	cterm=NONE
    hi Question		ctermfg=33	ctermbg=NONE	cterm=bold
    hi ModeMsg		ctermfg=33	ctermbg=NONE	cterm=bold
    hi VisualNOS	ctermfg=NONE	ctermbg=235	cterm=NONE
    hi SpecialKey	ctermfg=166	ctermbg=NONE	cterm=NONE
    hi NonText		ctermfg=240	ctermbg=235	cterm=NONE
    hi Directory	ctermfg=33	ctermbg=NONE	cterm=NONE
    hi ErrorMsg		ctermfg=234	ctermbg=160	cterm=NONE
    hi MoreMsg		ctermfg=33	ctermbg=NONE	cterm=NONE
    hi Title		ctermfg=166	ctermbg=NONE	cterm=bold
    hi WarningMsg	ctermfg=166	ctermbg=NONE	cterm=bold
    hi WildMenu		ctermfg=244	ctermbg=235	cterm=bold
    hi Folded		ctermfg=240	ctermbg=235	cterm=NONE
    hi FoldColumn	ctermfg=240	ctermbg=235	cterm=NONE
    hi DiffAdd		ctermfg=64	ctermbg=235	cterm=NONE
    hi DiffChange	ctermfg=136	ctermbg=235	cterm=NONE
    hi DiffDelete	ctermfg=160	ctermbg=235	cterm=NONE
    hi DiffText		ctermfg=33	ctermbg=235	cterm=NONE
    hi SignColumn	ctermfg=240	ctermbg=235	cterm=NONE
    hi IncSearch	ctermfg=234	ctermbg=166	cterm=NONE
    hi StatusLineNC	ctermfg=240	ctermbg=235	cterm=NONE
    hi VertSplit	ctermfg=240	ctermbg=235	cterm=NONE
    hi Underlined	ctermfg=61	ctermbg=NONE	cterm=underline 
    hi Ignore		ctermfg=234	ctermbg=NONE

    if v:version >= 700
      if has('spell')
        hi SpellBad	cterm=undercurl	ctermbg=NONE	ctermfg=160
        hi SpellCap	cterm=undercurl	ctermbg=NONE	ctermfg=33
        hi SpellRare	cterm=undercurl	ctermbg=NONE	ctermfg=125
        hi SpellLocal	cterm=undercurl	ctermbg=NONE	ctermfg=37
      endif

      hi Pmenu		ctermfg=244	ctermbg=235	cterm=NONE
      hi PmenuSel	ctermfg=234	ctermbg=33	cterm=NONE
      hi TabLine	ctermfg=240	ctermbg=235	cterm=NONE
      hi TabLineFill	ctermfg=240	ctermbg=235	cterm=NONE
      hi TabLineSel	ctermfg=244	ctermbg=234	cterm=bold
      hi CursorColumn	ctermfg=NONE	ctermbg=235	cterm=NONE
      hi CursorLine	ctermfg=NONE	ctermbg=235	cterm=NONE
      hi MatchParen	ctermfg=234	ctermbg=136	cterm=NONE
    endif
  endif
endif

" Links:
hi link		String		Constant
hi link		Character	Number
hi link		SpecialChar	LineNr
hi link		Tag		Identifier
hi link		cCppOut		LineNr
hi link		Warning		MoreMsg
hi link		Notice		Constant
hi link		CalToday	PreProc
hi link		MyTagListTagName	IncSearch
hi link		MyTagListTagScope	Constant

" vim:et:nosta:sw=2:ts=8:
" vim600:fdm=marker:fdl=1:
