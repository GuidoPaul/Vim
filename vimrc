" VIM Configuration File
" Author: GuidoPaul
"

" Vim plugin manager {{{
"
set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'sjl/gundo.vim'
Plug 'Yggdroot/indentLine'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'tommcdo/vim-exchange'
Plug 'terryma/vim-expand-region'
Plug 'fatih/vim-go'
Plug 'suan/vim-instant-markdown'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'honza/vim-snippets'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Valloric/YouCompleteMe'

" tpope's awesome vim plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" color scheme
Plug 'crusoexia/vim-dracula'
Plug 'tomasr/molokai'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nelstrom/vim-blackboard'
Plug 'altercation/vim-colors-solarized'

" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'javacomplete'
" ...

call plug#end()
"
" }}}


" General {{{
"
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"
let g:mapleader = ";"

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
"
" }}}


" VIM user interface {{{
"
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Show list instead of just completing
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*,*/tmp/*,*.so,*.swp,*.zip
endif

" Always show line numbers
set number
set relativenumber

"Always show current position
set ruler

" Always show the status line
set laststatus=2

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Have the mouse enabled all the time
if has('mouse')
    set mouse=a
    set selection=exclusive
    set selectmode=mouse,key
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set matchpairs+=<:>

" How many tenths of a second to blink when matching brackets
set mat=2

" Highlight the current line and column in every window
set colorcolumn=80
set cursorline
set cursorcolumn

" Vim's initial popup menu settings
set completeopt=longest,menuone,preview
set completeopt-=preview

" Text key word
set iskeyword+=_,$,@,%,#,-

" No annoying sound on errors. Silence please
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"
" }}}


" Colors and Fonts {{{
"
" Enable syntax highlighting
syntax enable

set background=dark
set t_Co=256

try
    " colorscheme solarized
    colorscheme desert
    " colorscheme molokai
    " colorscheme blackboard
    " colorscheme ron
catch
endtry

" Set extra options when running in GUI mode
if has("gui_running")
    color dracula
    let g:dracula_italic = 1
    " colorscheme solarized
    " colorscheme molokai
    " colorscheme dracula
    " colorscheme desert
    set guioptions=""
    set t_Co=256
    set guitablabel=%M\ %t
    " if has("gui_gtk2")
    "     set guifont=Consolas\ 13.5
    "     set guifontwide=YaHei\ Consolas\ Hybrid\ 12
    " else
    "     set guifont=Consolas:h13.5
    "     set guifontwide=YaHei\ Consolas\ Hybrid:h12
    " endif
    set guifont=Consolas\ 13.5
    set guifontwide=YaHei\ Consolas\ Hybrid\ 12
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" New file encoding
set fileencoding=utf-8 nobomb

" Auto file encoding detection order
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1
"
" }}}


" Files, backups, session and undo {{{
"
" turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" save when losing focus
autocmd FocusLost * :silent! wall

" initialize the new file title
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
autocmd BufNewFile * normal G

" set session options
set sessionoptions="blank,buffers,folds,globals,help,localoptions,options,resize,sesdir,slash,tabpages,unix,winpos,winsize"

" save and resume session
map <silent> <leader>ss :wa!<cr>:mksession! Session.vim<cr>
map <silent> <leader>rs :NERDTreeToggle<cr>:source Session.vim<cr>

" undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000  " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload
"
" }}}


" Text, tab, indent and fold related {{{
"
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

set shiftwidth=4 " number of spaces to use for autoindenting
set tabstop=4    " a tab is four spaces
set copyindent   " copy the previous indentation on autoindenting
set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'
set autowrite    " always set autowriteing on
set autoindent   " always set autoindenting on
set smartindent  " always set smartindenting on
set wrap         " wrap lines

" fill char the dividing line
set fillchars=vert:\ ,stl:\ ,stlnc:\

" Linebreak on 500 characters
set lbr
set tw=500

" Code fold
set foldcolumn=1
set foldmethod=marker
" autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | silent mkview | endif
" autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | endif
set foldtext=MyFoldText()

" Vim fold
augroup ft_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END

" Press space to activate code fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
"
" }}}


" Visual mode related {{{
"
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>
"
" }}}


" Moving around, tabs, windows and buffers {{{
"
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

nnoremap <Tab>   :bnext<cr>
nnoremap <S-Tab> :bprev<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Resize window
nmap w= :resize   +3<cr>
nmap w- :resize   -3<cr>
nmap w, :vertical resize -5<cr>
nmap w. :vertical resize +5<cr>

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Set new window position
set splitright
set splitbelow

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
" set showtabline=2
set showtabline=0
catch
endtry

" Return to last edit position when opening files (You want this!)
if has("autocmd")
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif
" Remember info about open buffers on close
set viminfo^=%
"
" }}}


" Editing mappings {{{
"
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>
endif

" Change tab to 4 spaces
nmap tt :%s/\t/    /g<cr>

" Copy the full text
map <C-A> ggvG$"+y

" Copy the selected text
vmap <C-c> "+y

" Stick in insert mode
imap <C-v> <Esc>"*pa

" Open in firefox
nmap fi :!firefox % & <cr><cr>

" Compile and run C, C++ and so on
nmap go :call CompileAndRun()<cr>

" Debug C, C++ by gdb
nmap <leader>db :call Rungdb()<cr>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Tidying your whitespace and blank line
nmap _$ :call Preserve("%s/\\s\\+$//e")<cr>
nmap <leader>bl :call Preserve("g/^\s*$/d")<cr>

" Full format
nmap _= :call Preserve("normal gg=G")<cr>

" Spell checking (pressing ;;ss will toggle and untoggle spell checking)
map <leader><leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader><leader>sn ]s
map <leader><leader>sp [s
map <leader><leader>sa zg
map <leader><leader>s? z=
"
" }}}


" Misc {{{
"
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly to begin, end of line in insert mode
imap <C-a> <Esc>^
imap <C-e> <Esc>$

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
"
" }}}


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
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %"
        exec "!time ./%<"
    elseif &filetype == 'markdown'
        " exec \"!pandoc --latex-engine=xelatex % -o %<.pdf -V mainfont='YaHei Consolas Hybrid'"
        exec "!tocmd_local -f %"
        " exec \"!google-chrome-stable preview/%.html"
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

function SetTitle()
    if &filetype == 'sh'
        call append(0, "\#!/bin/bash")
        call append(1, "")
    elseif &filetype == 'python'
        call append(0, "#!/usr/bin/env python")
        call append(1, "# -*- coding: utf-8 -*-")
        call append(2, "# Filename: ".expand("%"))
        call append(3, "")
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
" }}}

"
" }}}


" Plugin configuration {{{
"
" ack.vim {{{
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<cr>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<cr>

" When you search with Ack, display your results in cope by doing:
map <leader>cc :botright cope<cr>

map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" To go to the next search result
map <leader>n :cn<cr>

" To go to the previous search result
map <leader>p :cp<cr>
" }}}

" ctrlp.vim {{{
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
\ 'file': '\v\.(log|jpg|png|jpeg|DS_Store|coffee)$',
\ 'link': 'some_bad_symbolic_links',
\ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" }}}

" delimitMate {{{
" Provides insert mode auto-completion for quotes, parens, brackets, etc
" Especially the pointed brackets (oh my god)
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
autocmd FileType c,cpp,objc let b:delimitMate_jump_expansion = 1
autocmd FileType c,cpp,objc let b:delimitMate_expand_cr = 2
autocmd FileType c,cpp,objc let b:delimitMate_expand_space = 1
" autocmd FileType c,cpp,objc let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
autocmd FileType c,cpp,objc let b:delimitMate_matchpairs = "(:),[:],{:}"
" }}}

" gundo.vim {{{
let g:gundo_width = 40
let g:gundo_preview_height = 15
nnoremap <leader>h :GundoToggle<cr>
" }}}

" indentLine {{{
" Vim
let g:indentLine_color_term = 239
" GVim
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '┊'
" let g:indentLine_char = '⇢'
" let g:indentLine_concealcursor = ''
" let g:indentLine_conceallevel = 2
" }}}

" javacomplete {{{
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd FileType java,javascript,jsp inoremap <buffer> . .<C-X><C-O><C-P><Down>
" autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
" autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
" }}}

" nerdtree {{{
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
map <Leader>nt :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" rainbow_parentheses.vim {{{
let g:rbpt_colorpairs = [
\ ['brown',       'RoyalBlue3'],
\ ['Darkblue',    'SeaGreen3'],
\ ['darkgray',    'DarkOrchid3'],
\ ['darkgreen',   'firebrick3'],
\ ['darkcyan',    'RoyalBlue3'],
\ ['darkred',     'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown',       'firebrick3'],
\ ['gray',        'RoyalBlue3'],
\ ['black',       'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue',    'firebrick3'],
\ ['darkgreen',   'RoyalBlue3'],
\ ['darkcyan',    'SeaGreen3'],
\ ['darkred',     'DarkOrchid3'],
\ ['red',         'firebrick3'],
\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax   * RainbowParenthesesLoadRound
autocmd Syntax   * RainbowParenthesesLoadSquare
autocmd Syntax   * RainbowParenthesesLoadBraces
" }}}

" syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_highlighting=1

" pep8    code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
" pylint codes: http://pylint-messages.wikidot.com/all-codes
let g:syntastic_python_checkers=['pyflakes', 'pep8']
let g:syntastic_python_pep8_args='--ignore=E501,E225'

let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
nnoremap <Leader>s :call ToggleErrors()<cr>
" }}}

" tagbar {{{
nmap <silent> <F9> :TagbarToggle <cr>
nmap <silent> <leader>tb :TagbarToggle <cr>
let g:tagbar_autofocus = 1
let g:tagbar_width = 30
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" }}}

" vim-airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nnoremap <Tab>   :bnext<cr>
nnoremap <S-Tab> :bprev<cr>
" }}}

" vim-clang-format {{{
let g:clang_format#style_options = {
    \ "AccessModifierOffset" : -4,
    \ "AllowShortIfStatementsOnASingleLine" : "true",
    \ "AlwaysBreakTemplateDeclarations" : "true",
    \ "Standard" : "C++11",
    \ "ColumnLimit": "0"}
" map to <Leader>f in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<cr>
" }}}

" vim-commentary {{{
autocmd FileType cmake setlocal commentstring=#\ %s
" '\\\' or 'gcc':  Comment a line in normal mode
" 'gc': Comment a line in Visual mode
" 'gcap': Comment a Paragraph
" }}}

" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" '*', '-', 'nums'      " align key words
" <Enter>               " align left
" <Enter><Enter>        " align right
" <Enter><Enter><Enter> " align center
" }}}

" vim-easymotion {{{
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"
let g:EasyMotion_smartcase = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}

" vim-exchange {{{
" cxx - Use the current line
" X   - Use in Visual mode.
" cxc - Clear any {motion} pending for exchange
" }}}

" vim-expand-region {{{
map <leader>v <Plug>(expand_region_expand)
map <leader>V <Plug>(expand_region_shrink)
" }}}

" vim-go {{{
autocmd FileType go nnoremap <buffer>go :GoRun<cr>
autocmd FileType go nmap <Leader>f :GoFmt<cr>
autocmd FileType go nmap <Leader>i :GoImports<cr>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
" }}}

" vim-multiple-cursors {{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

" vim-signature {{{
" m[a-zA-Z] " Toggle mark and display it in the leftmost column
" '[a-zA-Z] " Jump to mark
" '.        " Place the last changed
" ''        " Place the last location
" m/        " Open location list and display marks from current buffer
" m<space>  " Remove all markers
" }}}

" vim-surround {{{
" 1.change
"      Text         Command      New Text
" ---------------   -------    -----------
" \"Hello |world!"   cs"'       'Hello world!'
" \"Hello |world!"   cs"<q>     <q>Hello world!</q>
"  (123+4|56)/2      cs)]       [123+456]/2
"  (123+4|56)/2      cs)[       [ 123+456  ]/2
"  <div>foo|</div>   cst<p>     <p>foo</p>
"  fo|o!             csw'       'foo'!
"  fo|o!             csW'       'foo!'
"
" 2.add
"      Text         Command       New Text
" ---------------   -------      -----------
"  Hello w|orld!     ysiw)        Hello (world)!
"  Hello w|orld!     csw)         Hello (world)!
"  fo|o              ysiwt<html>  <html>foo</html>
"  foo quu|x baz     yss"         \"foo quux baz"
"  foo quu|x baz     ySS"         "
"                                     foo quux baz
"                                 "
"
" 3.delete
" ds
"
" Normal mode
" -----------
" ds  - delete a surrounding
" cs  - change a surrounding
" ys  - add a surrounding
" yS  - add a surrounding and place the surrounded text on a new line + indent it
" yss - add a surrounding to the whole line
" ySs - add a surrounding to the whole line, place it on a new line + indent it
" ySS - same as ySs

" Visual mode
" -----------
" s   - in visual mode, add a surrounding
" S   - in visual mode, add a surrounding but place text on new line + indent it

" Insert mode
" -----------
" <CTRL-s> - in insert mode, add a surrounding
" <CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
" <CTRL-g>s - same as <CTRL-s>
" <CTRL-g>S - same as <CTRL-s><CTRL-s>
" }}}

" vim-trailing-whitespace {{{
map <leader><space> :FixWhitespace<cr>
" }}}

" YouCompleteMe {{{
nnoremap <leader>df :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap <F5> :YcmDiags<cr>
" nnoremap <F5> :YcmForceCompileAndDiagnostics<cr>
let g:ycm_global_ycm_extra_conf='~/Code/.ycm_extra_conf.py'
" Do not ask when starting vim
let g:ycm_confirm_extra_conf              = 0
let g:ycm_complete_in_comments            = 1
let g:syntastic_always_populate_loc_list  = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_cache_omnifunc                  = 0
let g:ycm_seed_identifiers_with_syntax    = 1
inoremap <leader>, <C-x><C-o>
" }}}
"
" }}}
