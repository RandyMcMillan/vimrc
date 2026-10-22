" ============================================================================
" MEMPOOL.SPACE API INTEGRATION FOR VIM
" ============================================================================

" 1. Default API Base URLs (Can be overridden in .vimrc for local/alternate instances)
if !exists('g:mempool_api_url')
    let g:mempool_api_url = 'https://mempool.space/api'
endif
if !exists('g:mempool_alt_api_url')
    let g:mempool_alt_api_url = 'https://bitcoin.gob.sv/api'
endif
if !exists('g:mempool_bitcoin_gob_sv_url')
    let g:mempool_bitcoin_gob_sv_url = 'https://bitcoin.gob.sv/api'
endif
if !exists('g:mempool_gob_sv_url')
    let g:mempool_gob_sv_url = 'https://bitcoin.gob.sv/api'
endif

" 2. Core API Request Function
function! MempoolFetch(...)
    " Ensure curl is available on system PATH
    if executable('curl') != 1
        echoerr "Mempool.vim Error: 'curl' executable not found in PATH."
        return
    endif

    " Support an optional alternate base URL as the first argument
    if a:0 == 1
        let l:base_url = g:mempool_api_url
        let l:endpoint = a:1
    elseif a:0 == 2
        let l:base_url = a:1
        let l:endpoint = a:2
    else
        echoerr 'Mempool.vim Error: expected MempoolFetch(endpoint) or MempoolFetch(base_url, endpoint).'
        return
    endif

    " Construct full request endpoint
    let l:full_url = l:base_url . l:endpoint
    let l:cmd = 'curl -s -S ' . shellescape(l:full_url)

    " Execute HTTP request
    let l:response = system(l:cmd)

    if v:shell_error != 0
        echoerr 'Mempool API request failed: ' . l:response
        return
    endif

    " Open or reuse a scratch buffer for output
    let l:bufname = '[Mempool: ' . l:endpoint . ']'
    let l:winnum = bufwinnr(l:bufname)

    if l:winnum != -1
        execute l:winnum . 'wincmd w'
    else
        vertical new
        execute 'file ' . fnameescape(l:bufname)
    endif

    " Configure scratch buffer settings
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal nobuflisted
    setlocal modifiable

    " Insert raw API response
    silent %delete _
    let l:lines = split(l:response, "\n")
    call setline(1, l:lines)

    " Auto-format JSON if jq is available and output starts with { or [
    if executable('jq') == 1 && !empty(l:lines) && (l:lines[0] =~# '^{\|^\[')
        silent %!jq .
    endif

    " Enable JSON syntax highlighting
    syntax enable
    setlocal filetype=json

    echo 'Fetched: ' . l:full_url
endfunction

" Optional autoload-style wrapper
function! mempool#Fetch(...)
    if a:0 == 1
        call MempoolFetch(a:1)
    elseif a:0 == 2
        call MempoolFetch(a:1, a:2)
    endif
endfunction

" Helper for explicit alternate sources
function! MempoolFetchFrom(base_url, endpoint)
    call MempoolFetch(a:base_url, a:endpoint)
endfunction

" ============================================================================
" COMMANDS & QUICK WRAPPERS
" ============================================================================

" Fetch custom endpoint (e.g., :Mempool /v1/fees/recommended)
command! -nargs=1 Mempool :call MempoolFetch(<q-args>)

" Fetch from an alternate data source (e.g., :MempoolAlt /v1/fees/recommended)
command! -nargs=1 MempoolAlt :call MempoolFetch(g:mempool_alt_api_url, <q-args>)
command! -nargs=1 MempoolGobSv :call MempoolFetch(g:mempool_bitcoin_gob_sv_url, <q-args>)
command! -nargs=1 MempoolBitcoinGobSv :call MempoolFetch(g:mempool_bitcoin_gob_sv_url, <q-args>)

" Helper wrappers for common endpoints
command! MempoolFees   :call MempoolFetch('/v1/fees/recommended')
command! MempoolHeight :call MempoolFetch('/blocks/tip/height')
command! MempoolBlocks :call MempoolFetch('/v1/blocks')
command! -nargs=1 MempoolTx  :call MempoolFetch('/tx/' . <q-args>)
command! -nargs=1 MempoolAddress :call MempoolFetch('/address/' . <q-args>)

" Alternate source helper wrappers
command! MempoolAltFees   :call MempoolFetch(g:mempool_alt_api_url, '/v1/fees/recommended')
command! MempoolAltHeight :call MempoolFetch(g:mempool_alt_api_url, '/blocks/tip/height')
command! MempoolGobSvFees   :call MempoolFetch(g:mempool_bitcoin_gob_sv_url, '/v1/fees/recommended')
command! MempoolGobSvHeight :call MempoolFetch(g:mempool_bitcoin_gob_sv_url, '/blocks/tip/height')

" ============================================================================
" DEFAULT KEYBINDINGS
" ============================================================================

" Leader shortcuts
nnoremap <silent> <leader>mpf :MempoolFees<CR>
nnoremap <silent> <leader>mph :MempoolHeight<CR>
nnoremap <silent> <leader>mpb :MempoolBlocks<CR>
nnoremap <silent> <leader>mpa :MempoolAltFees<CR>