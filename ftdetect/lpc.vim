function! LpcUtilsInit()
    "lpc shortcuts
    nmap <F5> <ESC>:!lpc_compile %<CR>
    nmap <F6> <ESC>:!lpc_update %<CR>
    nmap <F10> <ESC>:!lpc_test % 
    nmap <F9> <ESC>:!cat `echo "$PWD" \| sed -n -e "s/newtxii.*//"p`newtxii/log/debug.log <CR>

endfunction

function! LpcFileTypeDetect()
    let mypath = getcwd()
    let n = stridx(mypath, "newtxii")
    if n != -1
        set filetype=lpc
        call LpcUtilsInit()
    endif
endfunction

autocmd BufNewFile,BufRead *.c,*.h call LpcFileTypeDetect()
