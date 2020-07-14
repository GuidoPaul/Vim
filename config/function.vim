" Function Settings
" ---

" Helper functions {{{
"
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        " exec \"!g++ % -o %<"
        exec "!g++ % -g -Wall -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        " exec \"!time python %"
        exec "CocCommand python.execInTerminal"
    elseif &filetype == 'matlab'
        exec "!time runmatlab.sh %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'markdown'
        " exec \"!pandoc --latex-engine=xelatex % -o %<.pdf -V mainfont='YaHei Consolas Hybrid'"
        exec "!tocmd_conf -f %"
        exec "!google-chrome-stable preview/%.html"
        " exec \"!firefox preview/%.html"
    elseif &filetype == 'asm'
        exec "!as -o %<.o % && ld -s -o %< %<.o"
        exec "!time ./%<"
    endif
endfunction

function! Rungdb()
    exec "w"
    " exec \"!g++ % -g -Wall -o %<"
    "exec \"!gdb ./%<"
    exec "Pyclewn"
    exec "Cmapkeys"
endfunction

function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
    exe "normal mz"
endfunction

function! Preserve(command)
    " save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    exe a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

filetype plugin on
filetype indent on

function SetTitle()
    if &filetype == 'sh'
        call append(0, "\#!/bin/bash")
        call append(1, "")
    elseif &filetype == 'python'
        call append(0, "#!/usr/bin/env python")
        call append(1, "# -*- coding: utf-8 -*-")
        " call append(2, "# Filename: ".expand("%"))
        call append(2, "")
    elseif &filetype == 'markdown'
        call append(0, "<head><meta charset=\"UTF-8\"></head>")
    else
        call append(0, "/*")
        call append(1, " * File:   ".expand("%"))
        call append(2, " * Author: Bslin")
        call append(3, " * Mail:   Baoshenglin1994@gmail.com")
        call append(4, " *")
        call append(5, " * Created on ".strftime("%c"))
        call append(6, " */")
        call append(7, "")
    endif
    if &filetype == 'c'
        call append(8, "#include <stdio.h>")
        call append(9, "")
    endif
    if &filetype == 'cpp' && expand("%:e") == 'cpp'
        call append(8, "#include <bits/stdc++.h>")
        call append(9, "")
        call append(10, "using namespace std;")
        call append(11, "")
    endif
    if expand("%:e") == 'h'
        call append(8, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(9, "#define _".toupper(expand("%:r"))."_H")
        call append(10, "")
        call append(11, "#endif /* defined(_".toupper(expand("%:r"))."_H) */")
    endif
    if &filetype == 'java'
        call append(8,"public class ".expand("%:r"))
        call append(9,"")
    endif
endfunction

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

function! MyFoldText()
    let line = getline(v:foldstart)
    let end = v:foldend - v:foldstart
    let line .= "<" . v:foldstart . " + " . end .">"
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    return v:folddashes.sub
endfunction
"
" }}}

" vim: set ts=4 sw=4 tw=80 noet :
