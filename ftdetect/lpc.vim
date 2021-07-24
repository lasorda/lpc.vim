function! LpcUtilsInit()
    "lpc shortcuts
    nmap <F5> <ESC>:!lpc_compile %<CR>
    nmap <F6> <ESC>:!lpc_update %<CR>
    nmap <F10> <ESC>:!lpc_test % 
    nmap <F9> <ESC>:!clear && cat `echo "$PWD" \| sed -n -e "s/newtxii.*//"p`newtxii/log/debug.log <CR>

    command! -nargs=0 Format :ClangFormat

endfunction

function! LpcFileTypeDetect()
    let mypath = getcwd()
    if stridx(mypath, "newtxii") != -1 || stridx(mypath, "logic") != -1 || stridx(mypath, "testsuite") != -1
        set filetype=lpc
        call LpcUtilsInit()
    endif
endfunction

autocmd BufNewFile,BufRead *.c,*.h call LpcFileTypeDetect()
