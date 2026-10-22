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
        let l:endpoint = trim(a:1)
    elseif a:0 == 2
        let l:base_url = trim(a:1)
        let l:endpoint = trim(a:2)
    else
        echoerr 'Mempool.vim Error: expected MempoolFetch(endpoint) or MempoolFetch(base_url, endpoint).'
        return
    endif

    " Construct full request endpoint
    let l:full_url = l:base_url . l:endpoint
    " Execute HTTP request without invoking a shell
    let l:response = system(['curl', '-s', '-S', l:full_url])

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
command! -nargs=1 -complete=customlist,MempoolComplete Mempool :call MempoolFetch(<q-args>)

" Fetch from an alternate data source (e.g., :MempoolAlt /v1/fees/recommended)
command! -nargs=1 -complete=customlist,MempoolComplete MempoolAlt :call MempoolFetch(g:mempool_alt_api_url, <q-args>)
command! -nargs=1 -complete=customlist,MempoolComplete MempoolGobSv :call MempoolFetch(g:mempool_bitcoin_gob_sv_url, <q-args>)
command! -nargs=1 -complete=customlist,MempoolComplete MempoolBitcoinGobSv :call MempoolFetch(g:mempool_bitcoin_gob_sv_url, <q-args>)

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

let g:mempool_endpoints = [
\'/address/',
\'/address/:address',
\'/address/:address/txs',
\'/address/:address/txs/chain',
\'/address/:address/txs/mempool',
\'/address/:address/utxo',
\'/blocks',
\'/blocks/',
\'/blocks/tip/hash',
\'/blocks/tip/height',
\'/mempool',
\'/mempool/mining-pools/blob/master/pools-v2',
\'/mempool/recent',
\'/mempool/txids',
\'/tx',
\'/tx/',
\'/tx/:txId/rbf',
\'/tx/:txid',
\'/tx/:txid/hex',
\'/tx/:txid/merkle-proof',
\'/tx/:txid/merkleblock-proof',
\'/tx/:txid/outspend/:vout',
\'/tx/:txid/outspends',
\'/tx/:txid/raw',
\'/tx/:txid/status',
\'/txid/',
\'/txids',
\'/txs',
\'/txs/chain',
\'/txs/mempool',
\'/v1/asset/',
\'/v1/asset/:asset_id/icon',
\'/v1/assets/icons',
\'/v1/block/',
\'/v1/block/:blockHash/audit-summary',
\'/v1/block/:hash',
\'/v1/blocks',
\'/v1/blocks-bulk/',
\'/v1/blocks-bulk/:minHeight',
\'/v1/blocks/',
\'/v1/cpfp',
\'/v1/cpfp/',
\'/v1/difficulty-adjustment',
\'/v1/fees/mempool-blocks',
\'/v1/fees/precise',
\'/v1/fees/recommended',
\'/v1/fullrbf/replacements',
\'/v1/historical-price',
\'/v1/lightning/channels',
\'/v1/lightning/channels-geo',
\'/v1/lightning/channels-geo/',
\'/v1/lightning/channels-geo/:pubKey',
\'/v1/lightning/channels/',
\'/v1/lightning/channels/:channelId',
\'/v1/lightning/channels/txids',
\'/v1/lightning/nodes/',
\'/v1/lightning/nodes/:pubKey',
\'/v1/lightning/nodes/:pubKey/statistics',
\'/v1/lightning/nodes/countries',
\'/v1/lightning/nodes/country/',
\'/v1/lightning/nodes/country/:country',
\'/v1/lightning/nodes/isp-ranking',
\'/v1/lightning/nodes/isp/',
\'/v1/lightning/nodes/isp/:isp',
\'/v1/lightning/nodes/rankings',
\'/v1/lightning/nodes/rankings/age',
\'/v1/lightning/nodes/rankings/connectivity',
\'/v1/lightning/nodes/rankings/liquidity',
\'/v1/lightning/search',
\'/v1/lightning/statistics/',
\'/v1/lightning/statistics/:interval',
\'/v1/mining/blocks/audit/score/',
\'/v1/mining/blocks/audit/score/:blockHash',
\'/v1/mining/blocks/audit/scores/',
\'/v1/mining/blocks/audit/scores/:startHeight',
\'/v1/mining/blocks/fee-rates/',
\'/v1/mining/blocks/fee-rates/:timePeriod',
\'/v1/mining/blocks/fee-rates/:timePeriod/precise',
\'/v1/mining/blocks/fees/',
\'/v1/mining/blocks/fees/:timePeriod',
\'/v1/mining/blocks/predictions/',
\'/v1/mining/blocks/predictions/:timePeriod',
\'/v1/mining/blocks/rewards/',
\'/v1/mining/blocks/rewards/:timePeriod',
\'/v1/mining/blocks/sizes-weights/',
\'/v1/mining/blocks/sizes-weights/:timePeriod',
\'/v1/mining/blocks/timestamp/',
\'/v1/mining/blocks/timestamp/:timestamp',
\'/v1/mining/difficulty-adjustments/',
\'/v1/mining/difficulty-adjustments/1m',
\'/v1/mining/hashrate/',
\'/v1/mining/hashrate/3d',
\'/v1/mining/hashrate/pools/',
\'/v1/mining/pool/',
\'/v1/mining/pool/:slug',
\'/v1/mining/pool/:slug/blocks/',
\'/v1/mining/pool/:slug/hashrate',
\'/v1/mining/pools',
\'/v1/mining/pools/',
\'/v1/mining/reward-stats/',
\'/v1/mining/reward-stats/:blockCount',
\'/v1/prices',
\'/v1/replacements',
\'/v1/services/accelerator/accelerate',
\'/v1/services/accelerator/accelerations',
\'/v1/services/accelerator/accelerations/history',
\'/v1/services/accelerator/accelerations/stats',
\'/v1/services/accelerator/auto-accelerate',
\'/v1/services/accelerator/auto-accelerate/cancel',
\'/v1/services/accelerator/auto-accelerate/history',
\'/v1/services/accelerator/balance',
\'/v1/services/accelerator/cancel',
\'/v1/services/accelerator/estimate',
\'/v1/services/accelerator/history',
\'/v1/services/accelerator/invoice',
\'/v1/services/accelerator/top-up',
\'/v1/services/accelerator/top-up-history',
\'/v1/transaction-times',
\'/v1/tx/',
\'/v1/validate-address/',
\'/v1/validate-address/:address'
\]
" endpoints list defined above

" API endpoint tab completion
function! MempoolComplete(ArgLead, CmdLine, CursorPos)
    if !exists('g:mempool_endpoints')
        return []
    endif
    if a:ArgLead ==# ''
        return copy(g:mempool_endpoints)
    endif
    return filter(copy(g:mempool_endpoints), 'stridx(v:val, a:ArgLead) ==# 0')
endfunction
