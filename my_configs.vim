" =============================================================================
" Comprehensive Vim & mcmillan Configuration
" File: ~/.vim_runtime/my_configs.vim
" =============================================================================

" =============================================================================
" OVERRIDE DEFAULT PEAKSEA & FORCE mcmillan ON START
" =============================================================================
" Ensure peaksea never overrides your preferences on load
let g:peaksea_loaded = 1

" Force mcmillan for both GUI and Terminal consistently on startup
set t_Co=256
set background=light
colorscheme mcmillan
    autocmd BufWritePost my_configs.vim nested source % | redraw! | echomsg "Sourced " . expand('%:t')


augroup StartupScratchBuffer
    autocmd!
    autocmd VimEnter * if argc() == 0 | execute 'edit ' . tempname() . '.txt' | endif
augroup END

set go+=!
filetype plugin on
filetype on

" -----------------------------------------------------------------------------
" CORE EDITOR & TERMINAL SETTINGS
" -----------------------------------------------------------------------------
set nocompatible
if has('gui_running')
    set background=dark
else
    set background=light
endif
" =============================================================================
" FORCE mcmillan IN TERMINAL ON STARTUP
" =============================================================================
if !has('gui_running')
    " Ensure 256 colors are enabled for terminal Vim
    set t_Co=256
    
    " Force background and color scheme after terminal UI initializes
    augroup ForceTerminalmcmillan
        autocmd!
        autocmd VimEnter * nested set background=dark | colorscheme mcmillan
    augroup END
endif

set backspace=indent,eol,start
set nomodeline
set modelineexpr
set foldenable
set ruler
syntax on
set showcmd
set exrc
set number
set laststatus=2
set showmode
set title
set scrolloff=3
set hlsearch
set ignorecase
set incsearch
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set listchars=tab:>\ ,trail:-,nbsp:+
set list

" Hybrid line numbers
if exists("&relativenumber")
    set number relativenumber
    au BufReadPost * set relativenumber
endif

" Enable 256-color mode in terminal
if &t_Co < 256
    set t_Co=256
endif

let g:mcmillan_termcolors = 256
let g:mcmillan_termtrans = 1

" Timeout & Key Mapping Delays
set timeout
set timeoutlen=500
set ttimeoutlen=10

" Color guide column positions
set colorcolumn=3,5,40,50,79,81,129,131,159,161,209,211

" Leader Key Definition
let mapleader = "\\"

" Titlebar details
if has('title') && (has('gui_running') || &title)
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

"" Vim cterm highlighting example using Solarized mappings
"highlight Normal       ctermfg=14  ctermbg=0   " base0  / base03
"highlight Comment      ctermfg=11              " base01
"highlight Constant     ctermfg=3               " yellow
"highlight String       ctermfg=2               " green
"highlight Identifier   ctermfg=4               " blue
"highlight Statement    ctermfg=2               " green
"highlight PreProc      ctermfg=9               " orange
"highlight Type         ctermfg=3               " yellow
"highlight Special      ctermfg=1               " red
"highlight Error        ctermfg=1   ctermbg=0   " red / base03
"highlight Todo         ctermfg=5   ctermbg=0   " magenta / base03
"
"" Nord cterm 256-color mappings
"highlight Normal       ctermfg=254 ctermbg=236 " nord4 / nord0
"highlight Comment      ctermfg=242             " nord3
"highlight Constant     ctermfg=110             " nord9 (blue)
"highlight String       ctermfg=150             " nord14 (green)
"highlight Identifier   ctermfg=111             " nord10 (dark blue)
"highlight Statement    ctermfg=110             " nord9
"highlight PreProc      ctermfg=139             " nord15 (purple)
"highlight Type         ctermfg=73              " nord7 (cyan)
"highlight Error        ctermfg=167 ctermbg=236 " nord11 (red)
"
"" Gruvbox cterm 256-color values
"highlight Normal       ctermfg=223 ctermbg=235 " fg: #ebdbb2, bg: #282828
"highlight CursorLine               ctermbg=237 " bg: #3c3836
"highlight Comment      ctermfg=245             " fg: #928374
"highlight Constant     ctermfg=175             " fg: #d3869b (purple)
"highlight String       ctermfg=142             " fg: #b8bb26 (green)
"highlight Identifier   ctermfg=108             " fg: #8ec07c (aqua)
"highlight Function     ctermfg=108             " fg: #8ec07c (aqua)
"highlight Statement    ctermfg=167             " fg: #fb4934 (red)
"highlight PreProc      ctermfg=208             " fg: #fe8019 (orange)
"highlight Type         ctermfg=214             " fg: #fabd2f (yellow)

" -----------------------------------------------------------------------------
" mcmillan DARK UI HIGHLIGHTS (SAFE 256-COLOR INDEXING)
" -----------------------------------------------------------------------------
augroup mcmillanCompleteUI
    autocmd!

    autocmd ColorScheme mcmillan highlight NonText ctermfg=11 guifg=#586e75
    " --- Line Numbers & Gutters ---
    autocmd ColorScheme mcmillan highlight LineNr       ctermbg=234 ctermfg=240 guibg=#002b36 guifg=#586e75
    autocmd ColorScheme mcmillan highlight CursorLineNr ctermbg=235 ctermfg=245 guibg=#073642 guifg=#93a1a1 cterm=bold gui=bold
    autocmd ColorScheme mcmillan highlight SignColumn   ctermbg=234 ctermfg=244 guibg=#002b36 guifg=#839496
    autocmd ColorScheme mcmillan highlight FoldColumn   ctermbg=234 ctermfg=244 guibg=#002b36 guifg=#839496

    " --- Cursors & Guides ---
    autocmd ColorScheme mcmillan highlight CursorLine   ctermbg=235 guibg=#073642 cterm=none gui=none
    autocmd ColorScheme mcmillan highlight CursorColumn ctermbg=235 guibg=#073642
    autocmd ColorScheme mcmillan highlight ColorColumn  ctermbg=235 guibg=#073642

    " --- Selection & Search ---
    autocmd ColorScheme mcmillan highlight Visual    ctermbg=235 ctermfg=250 guibg=#073642 guifg=#eee8d5
    autocmd ColorScheme mcmillan highlight Search    ctermbg=136 ctermfg=234 guibg=#b58900 guifg=#002b36 cterm=none gui=none
    autocmd ColorScheme mcmillan highlight IncSearch ctermbg=166 ctermfg=234 guibg=#cb4b16 guifg=#002b36 cterm=none gui=none

    " --- Base Normal Text ---
    autocmd ColorScheme mcmillan highlight Normal ctermbg=234 ctermfg=244 guibg=#002b36 guifg=#839496

    " --- Statusline ---
    autocmd ColorScheme mcmillan highlight StatusLine   ctermbg=235 ctermfg=245 guibg=#073642 guifg=#93a1a1 cterm=none gui=none
    autocmd ColorScheme mcmillan highlight StatusLineNC ctermbg=235 ctermfg=240 guibg=#073642 guifg=#586e75 cterm=none gui=none

    " --- Syntax Elements ---
    autocmd ColorScheme mcmillan highlight Comment    ctermfg=240 guifg=#586e75 cterm=italic gui=italic
    autocmd ColorScheme mcmillan highlight Constant   ctermfg=37  guifg=#2aa198
    autocmd ColorScheme mcmillan highlight Identifier ctermfg=33  guifg=#268bd2
    autocmd ColorScheme mcmillan highlight Statement  ctermfg=64  guifg=#859900
    autocmd ColorScheme mcmillan highlight PreProc    ctermfg=166 guifg=#cb4b16
    autocmd ColorScheme mcmillan highlight Type       ctermfg=136 guifg=#b58900
    autocmd ColorScheme mcmillan highlight Special    ctermfg=125 guifg=#d33682

    " --- Lightline Tabline ---
    autocmd ColorScheme mcmillan highlight LightlineLeft_tabline_0               ctermfg=250 ctermbg=240 guifg=#d0d0d0 guibg=#666666
    autocmd ColorScheme mcmillan highlight LightlineLeft_tabline_0_1             ctermfg=240 ctermbg=238 guifg=#666666 guibg=#444444
    autocmd ColorScheme mcmillan highlight LightlineLeft_tabline_0_tabsel         ctermfg=240 ctermbg=235 guifg=#666666 guibg=#242424
    autocmd ColorScheme mcmillan highlight LightlineLeft_tabline_tabsel          ctermfg=250 ctermbg=235 guifg=#d0d0d0 guibg=#242424
    autocmd ColorScheme mcmillan highlight LightlineLeft_tabline_tabsel_0        ctermfg=235 ctermbg=240 guifg=#242424 guibg=#666666
    autocmd ColorScheme mcmillan highlight LightlineLeft_tabline_tabsel_1        ctermfg=235 ctermbg=238 guifg=#242424 guibg=#444444
    autocmd ColorScheme mcmillan highlight LightlineLeft_tabline_tabsel_tabsel   ctermfg=235 ctermbg=235 guifg=#242424 guibg=#242424
    autocmd ColorScheme mcmillan highlight LightlineRight_tabline_0              ctermfg=248 ctermbg=240 guifg=#a8a8a8 guibg=#666666
    autocmd ColorScheme mcmillan highlight LightlineRight_tabline_0_1            ctermfg=240 ctermbg=238 guifg=#666666 guibg=#444444
    autocmd ColorScheme mcmillan highlight LightlineRight_tabline_0_tabsel        ctermfg=240 ctermbg=235 guifg=#666666 guibg=#242424
    autocmd ColorScheme mcmillan highlight LightlineRight_tabline_tabsel         ctermfg=250 ctermbg=235 guifg=#d0d0d0 guibg=#242424
    autocmd ColorScheme mcmillan highlight LightlineRight_tabline_tabsel_0       ctermfg=235 ctermbg=240 guifg=#242424 guibg=#666666
augroup END

" Set base colorscheme
"colorscheme mcmillan
try
    colorscheme mcmillan
catch
endtry




" -----------------------------------------------------------------------------
" DYNAMIC FUNCTIONS & KEY BINDINGS
" -----------------------------------------------------------------------------

" 1. Toggle mcmillan Termcolors / Light-Dark Toggling
function! TogglemcmillanColors()
    if g:mcmillan_termcolors == 256
        let g:mcmillan_termcolors = 16
        echo "mcmillan Termcolors: 16"
    else
        let g:mcmillan_termcolors = 256
        echo "mcmillan Termcolors: 256"
    endif
    "colorscheme mcmillan
endfunction

" 2. Smart Fold Toggling across entire file
function! ToggleAllFolds()
    let l:has_closed_fold = 0
    let l:i = 1
    while l:i <= line('$')
        if foldclosed(l:i) != -1
            let l:has_closed_fold = 1
            break
        endif
        let l:i += 1
    endwhile

    if l:has_closed_fold
        normal! zR
        echo "All folds opened"
    else
        normal! zM
        echo "All folds collapsed"
    endif
endfunction

" 3. Check Terminal Size
function! CheckTerminalSize()
    let l:width = &columns
    if l:width < 80
        echo "Terminal is narrow (" . l:width . " cols)"
    else
        echo "Terminal width is comfortable (" . l:width . " cols)"
    endif
endfunction

" Custom Key Mappings
nmap <silent> <leader>t :call TogglemcmillanColors()<CR>
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>z :call ToggleAllFolds()<CR>
nmap <silent> qz        :call ToggleAllFolds()<CR>
nnoremap <silent> <leader>Z za
nnoremap <silent> <leader>T :call CheckTerminalSize()<CR>

nnoremap <silent> <leader>ff :set foldmethod=indent<CR>:echo "Fold method: indent"<CR>
nnoremap <silent> <leader>fs :set foldmethod=syntax<CR>:echo "Fold method: syntax"<CR>
nnoremap <silent> <leader>fm :set foldmethod=marker<CR>:echo "Fold method: marker"<CR>

" -----------------------------------------------------------------------------
" FILETYPE & AUTOCOMMAND RULES
" -----------------------------------------------------------------------------
if has("autocmd")
    augroup ConfigAutoSource
        autocmd!
        autocmd BufWritePost my_configs.vim source % | colorscheme mcmillan
        autocmd BufWritePost .vimrc source % | colorscheme mcmillan
        autocmd BufWritePost vimrc source % | colorscheme mcmillan
        autocmd BufWritePost my_configs.vim source % | colorscheme mcmillan
        autocmd BufWritePost my_configs.vim nested source % | redraw! | echomsg "Sourced " . expand('%:t')
    augroup END


augroup ImmediateSource
    autocmd!
    autocmd BufWritePost my_configs.vim nested source % | redraw! | echomsg "Sourced " . expand('%:t')
augroup END
" Save and source immediately with <leader>w
nnoremap <silent> <leader>w :w<CR>:source %<CR>:redraw!<CR>:echo "Saved & Sourced!"<CR>

" =============================================================================
" Build Systems Syntax & Tab Rule Engine (GNUmakefile, Makefile, *.mk, CMake)
" =============================================================================

if has("autocmd")
    augroup BuildSystemSyntaxRules
        autocmd!

        " --- 1. Filetype Recognition for Build & Make Files ---
        autocmd BufNewFile,BufRead GNUmakefile,Makefile,*.mk,*.am,*.in,Kbuild setfiletype make
        autocmd BufNewFile,BufRead CMakeLists.txt,*.cmake                    setfiletype cmake
        autocmd BufNewFile,BufRead *.bp,*.gn,*.gni                           setfiletype gn
        autocmd BufNewFile,BufRead meson.build,meson_options.txt             setfiletype meson

        " --- 2. Enforce Mandatory Real TABs for Makefiles ---
        autocmd FileType make setlocal noexpandtab
        autocmd FileType make setlocal tabstop=8
        autocmd FileType make setlocal shiftwidth=8
        autocmd FileType make setlocal softtabstop=0
        autocmd FileType make setlocal list

        " Highlight invalid space indentation at start of recipes in red
        autocmd FileType make syntax match MakefileLeadingSpaces /^\ \+/
        autocmd FileType make highlight MakefileLeadingSpaces ctermbg=160 guibg=#dc322f

        " --- 3. CMake Formatting Rules ---
        autocmd FileType cmake setlocal expandtab
        autocmd FileType cmake setlocal tabstop=2
        autocmd FileType cmake setlocal shiftwidth=2
        autocmd FileType cmake setlocal softtabstop=2

    augroup END
endif

    augroup FileTypeDetect
        autocmd!
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
        autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

        " File shebang detection
        autocmd BufNewFile,BufRead * if match(getline(1),"python") >= 0 | set filetype=python     | endif
        autocmd BufNewFile,BufRead * if match(getline(1),"node")   >= 0 | set filetype=javascript | endif
        autocmd BufNewFile,BufRead * if match(getline(1),"bash")   >= 0 | set filetype=bash       | endif
        autocmd BufNewFile,BufRead * if match(getline(1),"vim")    >= 0 | set filetype=vim        | endif
        autocmd BufNewFile,BufRead * if match(getline(1),"sh")     >= 0 | set filetype=shell      | endif

        " Indentation rules per filetype
        autocmd BufRead,BufNewFile *.rs set noexpandtab list
        autocmd BufRead,BufNewFile *.py set expandtab list
        autocmd BufRead,BufNewFile *.h,*.c,*.cpp set noexpandtab list
        autocmd BufRead,BufNewFile Makefile,GNUmakefile set noexpandtab softtabstop=4 list
        autocmd BufRead,BufNewFile *.sh* set list
        autocmd BufRead,BufNewFile *.vimrc* set noexpandtab list
        autocmd BufRead,BufNewFile *ockerfile* set noexpandtab list
        autocmd BufRead,BufNewFile *.yml,*.yaml set noexpandtab softtabstop=2 list
        autocmd BufRead,BufNewFile *.md set noexpandtab softtabstop=4 list

        " Restore cursor position
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END

    augroup VimScriptFolding
        autocmd!
        autocmd FileType vim setlocal expandtab shiftwidth=2 foldmethod=expr
        autocmd FileType vim let &l:foldexpr = "getline(v:lnum)=~'^\"\\ Section:'?'>1':getline(v:lnum)=~#'^fu'?'a1':getline(v:lnum)=~#'^endf'?'s1':'='"
    augroup END

    " C/C++ Clang Format
    augroup ClangFormatMap
        autocmd!
        autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
        autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    augroup END
endif

" -----------------------------------------------------------------------------
" PLUGIN & INTEGRATION SETTINGS
" -----------------------------------------------------------------------------
let g:ale_linters = {'vim': ['vint']}
let g:ale_sign_column_always = 1

let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
nmap <Leader>C :ClangFormatAutoToggle<CR>

" NERDTree Setup
let g:NERDTreeFileExtensionHighlightFullName = 1
let NERDTreeWinPos = 0
let NERDTreeShowHidden = 1

augroup NERDTreeSmartAutostart
    autocmd!
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * if argc() > 0 | wincmd p | endif
    "autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END
