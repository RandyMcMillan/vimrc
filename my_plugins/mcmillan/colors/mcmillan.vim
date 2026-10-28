" Vim color file --- Optimized Solarized (Adapted from Peaksea structure)
" Maintainer: Randy McMillan / Adapted for Solarized workflow
" Description: Clean, high-performance native-style Solarized color scheme supporting GUI and 256-color terminals.

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mcmillan"
":source % | colorscheme mcmillan
" Quick reload and re-apply mcmillan color scheme
nnoremap <leader>q :w<CR>:source %<CR>:colorscheme mcmillan<CR>:echo "mcmillan.vim reloaded!"<CR>
" Toggle background mode between light and dark
nnoremap <leader>bg :let &background = (&background == 'dark' ? 'light' : 'dark')<CR>:colorscheme mcmillan<CR>:echo "Background set to " . &background<CR>

" Helper function to set GUI and Cterm attributes simultaneously with zero redundancy
function! s:h(group, fg, bg, attr)
  let l:cmd = "hi " . a:group

  " Foreground checks
  if !empty(a:fg) && !empty(a:fg[0])
    let l:cmd .= " guifg=" . a:fg[0]
  endif
  if !empty(a:fg) && len(a:fg) > 1 && !empty(a:fg[1])
    let l:cmd .= " ctermfg=" . a:fg[1]
  endif

  " Background checks
  if !empty(a:bg) && !empty(a:bg[0])
    let l:cmd .= " guibg=" . a:bg[0]
  endif
  if !empty(a:bg) && len(a:bg) > 1 && !empty(a:bg[1])
    let l:cmd .= " ctermbg=" . a:bg[1]
  endif

  " Style / Attributes
  if !empty(a:attr)
    let l:cmd .= " gui=" . a:attr . " cterm=" . a:attr
  else
    let l:cmd .= " gui=NONE cterm=NONE"
  endif

  execute l:cmd
endfunction

if &background == 'light'
  " =========================================================================
  " LIGHT BACKGROUND CONFIGURATION (GUI + 256 Cterm combined)
  " =========================================================================
  call s:h("Normal",       ["#657b83", 66],  ["#fdf6e3", 230], "")
  call s:h("Search",       ["#fdf6e3", 230], ["#cb4b16", 166], "")
  call s:h("Visual",       ["",       ""],  ["#eee8d5", 254], "")
  call s:h("Cursor",       ["#fdf6e3", 230], ["#268bd2", 33],  "")
  call s:h("Special",      ["#b58900", 136], ["",       ""],  "")
  call s:h("Comment",      ["#93a1a1", 244], ["",       ""],  "italic")
  call s:h("Number",       ["#cb4b16", 166], ["",       ""],  "")
  call s:h("Constant",     ["#2aa198", 37],  ["",       ""],  "")
  call s:h("StatusLine",   ["#657b83", 66],  ["#eee8d5", 254], "")
  call s:h("LineNr",       ["#93a1a1", 244], ["#eee8d5", 254], "")
  call s:h("Question",     ["#268bd2", 33],  ["",       ""],  "bold")
  call s:h("PreProc",      ["#cb4b16", 166], ["",       ""],  "")
  call s:h("Statement",    ["#859900", 64],  ["",       ""],  "")
  call s:h("Type",         ["#b58900", 136], ["",       ""],  "")
  call s:h("Todo",         ["#dc322f", 160], ["#eee8d5", 254], "bold")
  call s:h("Error",        ["#dc322f", 160], ["",       ""],  "bold")
  call s:h("Identifier",   ["#268bd2", 33],  ["",       ""],  "")
  call s:h("ModeMsg",      ["#268bd2", 33],  ["",       ""],  "bold")
  call s:h("VisualNOS",    ["",       ""],  ["#eee8d5", 254], "")
  call s:h("SpecialKey",   ["#cb4b16", 166], ["",       ""],  "")
  call s:h("NonText",      ["#93a1a1", 244], ["#eee8d5", 254], "")
  call s:h("Directory",    ["#268bd2", 33],  ["",       ""],  "")
  call s:h("ErrorMsg",     ["#fdf6e3", 230], ["#dc322f", 160], "")
  call s:h("MoreMsg",      ["#268bd2", 33],  ["",       ""],  "")
  call s:h("Title",        ["#cb4b16", 166], ["",       ""],  "bold")
  call s:h("WarningMsg",   ["#cb4b16", 166], ["",       ""],  "bold")
  call s:h("WildMenu",     ["#657b83", 66],  ["#eee8d5", 254], "bold")
  " For Light Background
  call s:h("Folded",       ["#93a1a1", 244], ["#eee8d5", 254], "")
  call s:h("FoldColumn",   ["#93a1a1", 244], ["#eee8d5", 254], "")
  call s:h("DiffAdd",      ["#859900", 64],  ["#eee8d5", 254], "")
  call s:h("DiffChange",   ["#b58900", 136], ["#eee8d5", 254], "")
  call s:h("DiffDelete",   ["#dc322f", 160], ["#eee8d5", 254], "")
  call s:h("DiffText",     ["#268bd2", 33],  ["#eee8d5", 254], "")
  call s:h("SignColumn",   ["#93a1a1", 244], ["#eee8d5", 254], "")
  call s:h("IncSearch",    ["#fdf6e3", 230], ["#cb4b16", 166], "")
  call s:h("StatusLineNC", ["#93a1a1", 244], ["#eee8d5", 254], "")
  call s:h("VertSplit",    ["#93a1a1", 244], ["#eee8d5", 254], "")
  call s:h("Underlined",   ["#6c71c4", 61],  ["",       ""],  "underline")
  call s:h("Ignore",       ["#eee8d5", 254], ["",       ""],  "")

  if v:version >= 700
    if has('spell')
      hi SpellBad	guifg=NONE	guibg=NONE	guisp=#dc322f	cterm=undercurl	ctermbg=NONE	ctermfg=160
      hi SpellCap	guifg=NONE	guibg=NONE	guisp=#268bd2	cterm=undercurl	ctermbg=NONE	ctermfg=33
      hi SpellRare	guifg=NONE	guibg=NONE	guisp=#d33682	cterm=undercurl	ctermbg=NONE	ctermfg=125
      hi SpellLocal	guifg=NONE	guibg=NONE	guisp=#2aa198	cterm=undercurl	ctermbg=NONE	ctermfg=37
    endif
    call s:h("Pmenu",        ["#657b83", 66],  ["#eee8d5", 254], "")
    call s:h("PmenuSel",     ["#fdf6e3", 230], ["#268bd2", 33],  "")
    call s:h("PmenuSbar",    ["#657b83", 66],  ["#93a1a1", 244], "")
    call s:h("PmenuThumb",   ["#657b83", 66],  ["#eee8d5", 254], "")
    call s:h("TabLine",      ["#93a1a1", 244], ["#eee8d5", 254], "")
    call s:h("TabLineFill",  ["#93a1a1", 244], ["#eee8d5", 254], "")
    call s:h("TabLineSel",   ["#657b83", 66],  ["#fdf6e3", 230], "bold")
    call s:h("CursorColumn", ["",       ""],  ["#eee8d5", 254], "")
    call s:h("CursorLine",   ["",       ""],  ["#eee8d5", 254], "")
    call s:h("MatchParen",   ["#fdf6e3", 230], ["#b58900", 136], "")
  endif

else
  " =========================================================================
  " DARK BACKGROUND CONFIGURATION (Solarized Dark)
  " =========================================================================
  call s:h("Normal",       ["#839496", 244], ["#002b36", 234], "")
  call s:h("Comment",      ["#586e75", 240], ["",       ""],  "italic")
  call s:h("Constant",     ["#2aa198", 37],  ["",       ""],  "")
  call s:h("Number",       ["#cb4b16", 166], ["",       ""],  "")
  call s:h("Identifier",   ["#268bd2", 33],  ["",       ""],  "")
  call s:h("Statement",    ["#859900", 64],  ["",       ""],  "")
  call s:h("PreProc",      ["#cb4b16", 166], ["",       ""],  "")
  call s:h("Type",         ["#b58900", 136], ["",       ""],  "")
  call s:h("Special",      ["#b58900", 136], ["",       ""],  "")
  call s:h("Error",        ["#dc322f", 160], ["",       ""],  "bold")
  call s:h("Todo",         ["#dc322f", 160], ["#073642", 235], "bold")
  call s:h("Search",       ["#002b36", 234], ["#b58900", 136], "")
  call s:h("Visual",       ["",       ""],  ["#073642", 235], "")
  call s:h("Cursor",       ["#002b36", 234], ["#839496", 244], "")
  call s:h("StatusLine",   ["#839496", 244], ["#073642", 235], "")
  call s:h("LineNr",       ["#586e75", 240], ["#073642", 235], "")
  call s:h("Question",     ["#268bd2", 33],  ["",       ""],  "bold")
  call s:h("ModeMsg",      ["#268bd2", 33],  ["",       ""],  "bold")
  call s:h("VisualNOS",    ["",       ""],  ["#073642", 235], "")
  call s:h("SpecialKey",   ["#cb4b16", 166], ["",       ""],  "")
  call s:h("NonText",      ["#586e75", 240], ["#073642", 235], "")
  call s:h("Directory",    ["#268bd2", 33],  ["",       ""],  "")
  call s:h("ErrorMsg",     ["#002b36", 234], ["#dc322f", 160], "")
  call s:h("MoreMsg",      ["#268bd2", 33],  ["",       ""],  "")
  call s:h("Title",        ["#cb4b16", 166], ["",       ""],  "bold")
  call s:h("WarningMsg",   ["#cb4b16", 166], ["",       ""],  "bold")
  call s:h("WildMenu",     ["#839496", 244], ["#073642", 235], "bold")
  " For Dark Background
  call s:h("Folded",       ["#586e75", 240], ["#073642", 235], "")
  call s:h("FoldColumn",   ["#586e75", 240], ["#073642", 235], "")
  call s:h("DiffAdd",      ["#859900", 64],  ["#073642", 235], "")
  call s:h("DiffChange",   ["#b58900", 136], ["#073642", 235], "")
  call s:h("DiffDelete",   ["#dc322f", 160], ["#073642", 235], "")
  call s:h("DiffText",     ["#268bd2", 33],  ["#073642", 235], "")
  call s:h("SignColumn",   ["#586e75", 240], ["#073642", 235], "")
  call s:h("IncSearch",    ["#002b36", 234], ["#cb4b16", 166], "")
  call s:h("StatusLineNC", ["#586e75", 240], ["#073642", 235], "")
  call s:h("VertSplit",    ["#586e75", 240], ["#073642", 235], "")
  call s:h("Underlined",   ["#6c71c4", 61],  ["",       ""],  "underline")
  call s:h("Ignore",       ["#002b36", 234], ["",       ""],  "")

  if v:version >= 700
    if has('spell')
      hi SpellBad	guifg=NONE	guibg=NONE	guisp=#dc322f	cterm=undercurl	ctermbg=NONE	ctermfg=160
      hi SpellCap	guifg=NONE	guibg=NONE	guisp=#268bd2	cterm=undercurl	ctermbg=NONE	ctermfg=33
      hi SpellRare	guifg=NONE	guibg=NONE	guisp=#d33682	cterm=undercurl	ctermbg=NONE	ctermfg=125
      hi SpellLocal	guifg=NONE	guibg=NONE	guisp=#2aa198	cterm=undercurl	ctermbg=NONE	ctermfg=37
    endif
    call s:h("Pmenu",        ["#839496", 244], ["#073642", 235], "")
    call s:h("PmenuSel",     ["#002b36", 234], ["#268bd2", 33],  "")
    call s:h("TabLine",      ["#586e75", 240], ["#073642", 235], "")
    call s:h("TabLineFill",  ["#586e75", 240], ["#073642", 235], "")
    call s:h("TabLineSel",   ["#839496", 244], ["#002b36", 234], "bold")
    call s:h("CursorColumn", ["",       ""],  ["#073642", 235], "")
    call s:h("CursorLine",   ["",       ""],  ["#073642", 235], "")
    call s:h("MatchParen",   ["#002b36", 234], ["#b58900", 136], "")
  endif
endif

" Syntax Links:
hi link String               Constant
hi link Character            Number
hi link SpecialChar          LineNr
hi link Tag                  Identifier
hi link cCppOut              LineNr
hi link Warning              MoreMsg
hi link Notice               Constant
hi link CalToday             PreProc
hi link MyTagListTagName     IncSearch
hi link MyTagListTagScope    Constant

" =========================================================================
" LIGHTLINE TABLINE INTEGRATION
" =========================================================================
augroup McMillanLightline
  autocmd!
  autocmd ColorScheme mcmillan,solarized call s:ApplyLightlineTabline()
augroup END

function! s:ApplyLightlineTabline()
  if &background == 'light'
    let l:bg_active   = ["#fdf6e3", 230]
    let l:bg_inactive = ["#eee8d5", 254]
    let l:bg_subtle   = ["#93a1a1", 244]
    let l:fg_active   = ["#657b83", 66]
    let l:fg_inactive = ["#93a1a1", 244]
  else
    let l:bg_active   = ["#002b36", 234]
    let l:bg_inactive = ["#073642", 235]
    let l:bg_subtle   = ["#586e75", 240]
    let l:fg_active   = ["#839496", 244]
    let l:fg_inactive = ["#586e75", 240]
  endif

  call s:h("LightlineLeft_tabline_0",           l:fg_inactive, l:bg_subtle,   "")
  call s:h("LightlineLeft_tabline_0_1",         l:bg_subtle,   l:bg_inactive, "")
  call s:h("LightlineLeft_tabline_0_tabsel",    l:bg_subtle,   l:bg_active,   "")
  call s:h("LightlineLeft_tabline_tabsel",      l:fg_active,   l:bg_active,   "bold")
  call s:h("LightlineLeft_tabline_tabsel_0",    l:bg_active,   l:bg_subtle,   "")
  call s:h("LightlineLeft_tabline_tabsel_1",    l:bg_active,   l:bg_inactive, "")
  call s:h("LightlineLeft_tabline_tabsel_tabsel", l:bg_active, l:bg_active,   "")

  call s:h("LightlineRight_tabline_0",          l:fg_inactive, l:bg_subtle,   "")
  call s:h("LightlineRight_tabline_0_1",        l:bg_subtle,   l:bg_inactive, "")
  call s:h("LightlineRight_tabline_0_tabsel",   l:bg_subtle,   l:bg_active,   "")
  call s:h("LightlineRight_tabline_tabsel",     l:fg_active,   l:bg_active,   "bold")
  call s:h("LightlineRight_tabline_tabsel_0",   l:bg_active,   l:bg_subtle,   "")
endfunction

" =========================================================================
" VISUAL TEST SCRATCH BUFFER
" =========================================================================
" usage :McmillanTest
command! McmillanTest call s:OpenTestBuffer()

function! s:OpenTestBuffer()
  new
  setlocal buftype=nofile bufhidden=wipe noswapfile
  
  let l:lines = [
        \ "=== MCMILLAN.VIM VISUAL TEST BUFFER ===",
        \ "",
        \ "/* Comment: The quick brown fox jumps over the lazy dog */",
        \ "#include <stdio.h>",
        \ "",
        \ "// Constants and Numbers",
        \ "const int MAX_USERS = 42;",
        \ "float pi = 3.14159;",
        \ "char *greeting = \"Hello, McMillan!\";",
        \ "",
        \ "// Keywords, Types, and Statements",
        \ "typedef struct {",
        \ "    unsigned long id;",
        \ "    char name[32];",
        \ "} UserRecord;",
        \ "",
        \ "if (user.id == 0) {",
        \ "    fprintf(stderr, \"Error: Invalid user ID\\n\");",
        \ "} else {",
        \ "    do_something(&user);",
        \ "}",
        \ "",
        \ "// Todo and Error Highlights",
        \ "// TODO: Fix memory leak in buffer allocation",
        \ "// ERROR: Unhandled exception caught",
        \ ]
  
  call setline(1, l:lines)
  setlocal syntax=c
endfunction

" =========================================================================
" VISUAL TEST SCRATCH BUFFER (Expanded)
" =========================================================================
command! McmillanTestExpanded call s:OpenTestBuffer()

function! s:OpenTestBuffer()
  new
  setlocal buftype=nofile bufhidden=wipe noswapfile
  
  let l:lines = [
        \ "=== MCMILLAN.VIM COMPREHENSIVE VISUAL TEST BUFFER ===",
        \ "",
        \ "/* 1. C / C++ & Preprocessor */",
        \ "#include <stdio.h>",
        \ "#define MAX_BUFFER 1024",
        \ "const int STATUS_OK = 200;",
        \ "char *msg = \"Hello, McMillan Solarized!\";",
        \ "",
        \ "typedef struct {",
        \ "    unsigned long id;",
        \ "    char label[32];",
        \ "} Record;",
        \ "",
        \ "if (record.id == 0) {",
        \ "    fprintf(stderr, \"Error: Invalid ID\\n\");",
        \ "} else {",
        \ "    process_record(&record);",
        \ "}",
        \ "",
        \ "/* 2. Rust Syntax & Types */",
        \ "pub fn calculate_hash(input: &[u8]) -> u64 {",
        \ "    let mut hasher = DefaultHasher::new();",
        \ "    input.hash(&mut hasher);",
        \ "    hasher.finish()",
        \ "}",
        \ "",
        \ "/* 3. Todo, Error & Special Highlights */",
        \ "// TODO: Optimize buffer allocation routine",
        \ "// FIXME: Potential null pointer dereference",
        \ "// NOTE: Check terminal color index mapping",
        \ "",
        \ "/* 4. Diff Highlights */",
        \ "+    Added configuration line for ctermfg",
        \ "-    Removed redundant highlight definitions",
        \ "!    Modified helper function signature",
        \ "",
        \ "/* 5. Numbers & Constants */",
        \ "let hex_val = 0x2B36;",
        \ "let float_pi = 3.14159;",
        \ ]
  
  call setline(1, l:lines)
  setlocal syntax=cpp
endfunction

" =========================================================================
" VISUAL TEST SCRATCH BUFFER (Expanded with Shell, Make & Markdown)
" =========================================================================
command! McmillanTestMarkdown call s:OpenTestBuffer()

function! s:OpenTestBuffer()
  new
  setlocal buftype=nofile bufhidden=wipe noswapfile
  
  let l:lines = [
        \ "=== MCMILLAN.VIM COMPREHENSIVE VISUAL TEST BUFFER ===",
        \ "",
        \ "/* 1. C / C++ & Preprocessor */",
        \ "#include <stdio.h>",
        \ "#define MAX_BUFFER 1024",
        \ "const int STATUS_OK = 200;",
        \ "",
        \ "# 2. Shell & Git Workflow",
        \ "#!/usr/bin/env bash",
        \ "git commit -m \"b17c011 fix parsing error E254\"",
        \ "export GIT_CONFIG_GLOBAL=/dev/null",
        \ "",
        \ "# 3. Makefile & Build Targets",
        \ "all: clean build test",
        \ "",
        \ "build:",
        \ "\tcargo build --workspace --release",
        \ "",
        \ "# 4. Markdown & Documentation Syntax",
        \ "# Header 1: Decentralized Protocol Engineering",
        \ "## Header 2: NIP-34 Git Remote Helpers",
        \ "- Bullet item with **bold text** and `inline code`",
        \ "> Blockquote: Cryptographic proof-of-work commit mining",
        \ "",
        \ "/* 5. Todo, Error & Special Highlights */",
        \ "// TODO: Optimize buffer allocation routine",
        \ "// FIXME: Potential null pointer dereference",
        \ "",
        \ "/* 6. Diff Highlights */",
        \ "+    Added lightline tabline override rule",
        \ "-    Removed redundant color attributes",
        \ ]
  
  call setline(1, l:lines)
  setlocal syntax=markdown
endfunction

" vim:et:nosta:sw=2:ts=8:
" vim600:fdm=marker:fdl=1:
