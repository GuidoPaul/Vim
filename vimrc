" VIM Configuration File
" Author: GuidoPaul
"

" Let Vundle manage Vbundle {{{
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My plugin here:
" Keep Plugin commands between vundle#begin/end.
" original plugin on GitHub repo

" plugin on GitHub repo
Plugin 'jiangmiao/auto-pairs'
" Plugin 'Rip-Rip/clang_complete'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
" Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'bufexplorer.zip'
Plugin 'javacomplete'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" }}}


" General {{{
"
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Enable syntax hightlighting
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
"
" }}}


" VIM user interface {{{
"
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
"   let $LANG='en' 
"   set langmenu=en
"   source $VIMRUNTIME/delmenu.vim
"   source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set number ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
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

" Turn off Bram's message when it starts up
set shortmess=atI

" Highlight the current line and column in every window
set cursorline
set cursorcolumn

" Vim's initial popup menu settings
set completeopt=longest,menuone,preview

" Text key word
set iskeyword+=_,$,@,%,#,-

" No annoying sound on errors. Silence please
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Save when losing focus
autocmd FocusLost * :silent! wall

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Code fold {{{
set foldenable
set foldnestmax=3
set foldmethod=syntax
set foldlevelstart=99
" Press space to activate code fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" }}}
"
" }}}


" Colors and Fonts {{{
"
" Enable syntax highlighting
syntax enable 

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
	colorscheme ron
    set guioptions=""
    " set guioptions-=T       " no toolbar
    " set guioptions-=m
    " set go-=r               " no right scrollbar
    " set go-=l               " no left scrollbar
    " set go-=b               " no bottom scrollbar
    " set go-=L               " no scrollbar even if split
    " set go-=L               " no scrollbar even if split
    " set go-=L               " no scrollbar even if split
    " set go-=R               " no scrollbar even if split
    set t_Co=256
    set guitablabel=%M\ %t
    if has("gui_gtk2")
        set guifont=Consolas\ 13
    else
        set guifont=Consolas:h13
    endif
endif

" set guifont=Powerline\ Consolas\ 13
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
" set guifont=Literation\ Mono\ Powerline\ 12
" set guifont=YaHei\ Consolas\ Hybrid\ 13
" set guifont=Inconsolata\ 13


" Encoding {{{
set encoding=utf-8 nobomb           " Vim inside encoding (buffer, register...)
" set encoding=utf-8            " Vim inside encoding (buffer, register...)
set fileencoding=utf-8 nobomb       " New file encoding 
" set fileencoding=utf-8 " New file encoding 
" Auto file encoding detection order
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1 
" }}}

" Use Unix as the standard file type
set ffs=unix,dos,mac
"
" }}}


" Files, backups and undo {{{
"
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
"
" }}}


" Text, tab and indent related {{{
"
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set shiftwidth=4 " number of spaces to use for autoindenting
set tabstop=4    " a tab is four spaces
set copyindent   " copy the previous indentation on autoindenting
set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'
set autowrite    " always set autowriteing on
set autoindent   " always set autoindenting on
set smartindent  " always set smartindenting on
set wrap         " wrap lines
set selection=exclusive
set selectmode=mouse,key

" fill char the dividing line
set fillchars=vert:\ ,stl:\ ,stlnc:\

" Linebreak on 500 characters
set lbr
set tw=500
" }}}


" Visual mode related {{{
"
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
"
" }}}


" Moving around, tabs, windows and buffers {{{
"
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

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

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

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

" set custom file types I've configured
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript

" Vim fold method {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Status line {{{
" Always show the status line
set laststatus=2

" Format the status line
if has('statusline')
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
endif
" }}}
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
nmap tt :%s/\t/    /g<CR>

" Copy the full text
map <C-A> ggVG$"+y

" Indent the full text
map <F12> gg=G

" Copy the selected text
vmap <C-c> "+y

" Stick in insert mode
imap <C-v> <Esc>"*pa

" Stick in normal mode
" map <C-v> "*pa<Esc>

" Change stick mode
" set pastetoggle=<C-q>

" Markdown to HTML
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>

" Open in firefox
nmap fi :!firefox % & <CR><CR>

" Press 'go' to run C、C++、Java、sh、python、html、go、mkd file
autocmd BufRead,BufNewFile *.dot nmap go :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
nmap go :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		exec "!time bash %"
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html' || &filetype == 'xhtml'
		exec "!firefox % &"
    elseif &filetype == 'go'
        " exec \"!go build %<"
		exec "!time go run %"
    elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
    elseif &filetype == 'asm'
		exec "!as -o %<.o % && ld -s -o %< %<.o"
		exec "!time ./%<"
		" exec \"!nasm -f elf % && ld -m elf_i386 -s -o %< %<.o"
		" exec \"!time ./%<"
	endif
endfunc

" Press 'F8' to debug C, C++ file
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"
" }}}


" Ack searching and cope displaying {{{
"    requires ack.vim - it's much better than vimgrep/grep 
"
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
" }}}


" Spell checking {{{
"
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}


" Misc {{{
"
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" nnoremap mm :%s/\r\+$//e<CR>

" Quickly to begin, end of line in insert mode
imap <C-a> <Esc>^
imap <C-e> <Esc>$

" Remove the blank line
nnoremap <F9> :g/^\s*$/d<CR>

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

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


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
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
"
" }}}


" Initialize the new file title {{{
"
" Create a Shell, Python, C, C++, CH, or Java file
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'sh'
		call setline(1,"\#!/bin/bash")
		call append(line("."), "")
    elseif &filetype == 'python'
		call setline(1,"#!/usr/bin/env python")
		call append(line("."),"# -*- coding: utf-8 -*-")
		call append(line(".")+1,"# Filename: ".expand("%"))
		call append(line(".")+2, "")
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else
		call setline(1, "/*")
		call append(line("."), " * File:   ".expand("%"))
		call append(line(".")+1, " * Author: Bslin")
		call append(line(".")+2, " * Mail:   Baoshenglin1994@gmail.com")
		call append(line(".")+3, " *")
		call append(line(".")+4, " * Created on ".strftime("%c"))
		call append(line(".")+5, " */")
		call append(line(".")+6, "")
	endif
	if &filetype == 'c'
		call append(line(".")+7, "#include <stdio.h>")
		call append(line(".")+8, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+7, "#include <cstdio>")
		call append(line(".")+8, "#include <iostream>")
		call append(line(".")+9, "using namespace std;")
		call append(line(".")+10, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+7, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+9, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+7,"public class ".expand("%:r"))
		call append(line(".")+8,"")
	endif
endfunc
autocmd BufNewFile * normal G
"
" }}}


" Plugin configuration {{{
"
" auto-pairs {{{
" }}}

" bufexplorer {{{
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
nmap <leader>bf :BufExplorer<cr>
"}}}

" clang_complete {{{
" need install clang libclang1 libclang-dev
let g:clang_complete_copen=1       "open quickfix window on error
" let g:clang_periodic_quickfix=1  "periodically update the quickfix window
let g:clang_snippets=1
let g:clang_close_preview=1        "close automatically after a completion
let g:clang_use_library=1
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'  

let s:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
if isdirectory(s:clang_library_path)
	let g:clang_library_path=s:clang_library_path
endif
" }}}

" ctrlp {{{
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_open_multiple_files = 'v'

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(log|jpg|png|jpeg|DS_Store|coffee)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}

" indentline {{{
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
" let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '│'
" }}}

" javacomplete {{{
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd FileType java,javascript,jsp inoremap <buffer> . .<C-X><C-O><C-P><Down>
" autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
" autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
" }}}

" neocomplcache {{{
let g:neocomplcache_enable_at_startup = 1
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-Y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><Enter> pumvisible() ? "\<C-Y>" : "\<Enter>"

" :help neocomplcache-faq
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
"let g:clang_use_library = 1
" }}}

" nerdtree {{{
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=25
let NERDTreeIgnore = ['\.pyc$']
map <Leader>nt :NERDTreeToggle<CR> 
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
" let g:syntastic_ignore_files=[".*\.py$"]
" }}}

" tagbar {{{
let g:tagbar_left = 0
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
nmap <silent> <F3> :TagbarToggle <CR>
nmap <silent> <leader>ta :TagbarToggle <CR>
" autocmd FileType java,cpp nested :TagbarOpen
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
nmap cc :!ctags -R <CR><CR>
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" }}}

" vim-airline {{{
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
" }}}

" vim-commentary {{{
" '\\\' or 'gcc':  Comment a line in normal mode
" 'gc': Comment a line in Visual mode
" 'gcap': Comment a Paragraph
" }}}

" multiple-cursors {{{
" 'Ctrl-n':     select
" }}}

" vim-snippets {{{
" }}}

" surround {{{
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
"
" }}}

" Youcompleteme {{{
nnoremap <leader>df :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" Do not ask when starting vim
let g:ycm_confirm_extra_conf=0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
" }}}

