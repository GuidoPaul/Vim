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
Plugin 'mileszs/ack.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
"" color scheme
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

" plugin from http://vim-scripts.org/vim/scripts.html
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

" Show list instead of just completing
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show line numbers
set number

" Always show the status line
set ruler
set laststatus=2

" Height of the command bar
set cmdheight=1

" Change buffer - without saving
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

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases 
set hlsearch   " Highlight search results
set incsearch  " Makes search act like search in modern browsers

" Show matching brackets when text indicator is over them
set showmatch 
set matchpairs+=<:>

" How many tenths of a second to blink when matching brackets
set mat=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

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
"
" }}}


" Colors and Fonts {{{
"
" Enable syntax highlighting
syntax enable 

set background=dark

try
    colorscheme desert
	" colorscheme ron
catch
endtry

" Set extra options when running in GUI mode
if has("gui_running")
	colorscheme molokai
    " colorscheme solarized
	" colorscheme ron
    set guioptions=""
    set t_Co=256
    set guitablabel=%M\ %t
    if has("gui_gtk2")
        set guifont=Consolas\ 13
    else
        set guifont=Consolas:h13
    endif
endif

set encoding=utf-8 nobomb           " Vim inside encoding (buffer, register...)
set fileencoding=utf-8 nobomb       " New file encoding 

" Auto file encoding detection order
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1 

" Use Unix as the standard file type
set ffs=unix,dos,mac
"
" }}}


" Files, backups and undo {{{
"
" turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" save when losing focus
autocmd FocusLost * :silent! wall

" set custom file types I've configured
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{html,htm}  set filetype=html
au BufRead,BufNewFile *.{go}        set filetype=go
au BufRead,BufNewFile *.{js}        set filetype=javascript

" initialize the new file title
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
autocmd BufNewFile * normal G

" set session options
set sessionoptions="blank,buffers,folds,globals,help,localoptions,options,resize,sesdir,slash,tabpages,unix,winpos,winsize"

" save undo history
set undodir=~/.undo_history/
set undofile

" save and resume session
map <silent> <leader>ss :wa!<cr>:mksession! my.vim<cr>:wviminfo! my.viminfo<cr>
map <silent> <leader>rs :source my.vim<cr>:rviminfo my.viminfo<cr>
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
set nowrap       " no wrap lines

" fill char the dividing line
set fillchars=vert:\ ,stl:\ ,stlnc:\

" Linebreak on 500 characters
set lbr
set tw=500

" Code fold
set foldenable
set foldnestmax=3
set foldmethod=syntax
set foldlevelstart=99
" Press space to activate code fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Vim fold
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
augroup END

" Resize splits when the window is resized
autocmd VimResized * :wincmd =
"
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

" Copy the selected text
vmap <C-c> "+y

" Stick in insert mode
imap <C-v> <Esc>"*pa

" Open in firefox
nmap fi :!firefox % & <CR><CR>

" Compile and run C, C++ and so on
nmap go :call CompileAndRun()<cr>

" Debug C, C++ by gdb
nmap <leader>db :call Rungdb()<cr>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Tidying your whitespace and blank line
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
nmap <leader>bl :call Preserve("g/^\s*$/d")<CR>
"
" }}}


" Spell checking {{{
"
" Pressing ,ss will toggle and untoggle spell checking
map <leader><leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader><leader>sn ]s
map <leader><leader>sp [s
map <leader><leader>sa zg
map <leader><leader>s? z=
" }}}


" Misc {{{
"
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly to begin, end of line in insert mode
imap <C-a> <Esc>^
imap <C-e> <Esc>$

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
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		exec "!time bash %"
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
		exec "!firefox % &"
    elseif &filetype == 'go'
		exec "!go build %<"
		exec "!time go run %"
    elseif &filetype == 'mkd'
		exec "!pandoc % --latex-engine=pdflatex -o %<.pdf"
    elseif &filetype == 'asm'
		exec "!as -o %<.o % && ld -s -o %< %<.o"
		exec "!time ./%<"
	endif
endfunction

function! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunction

function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction

function! Preserve(command)
    " save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
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
    elseif &filetype == 'mkd'
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
		call append(8, "#include <cstdio>")
		call append(9, "#include <iostream>")
		call append(10, "using namespace std;")
		call append(11, "")
	endif
	if expand("%:e") == 'h'
		call append(8, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(9, "#define _".toupper(expand("%:r"))."_H")
		call append(10, "")
		call append(11, "#endif")
	endif
	if &filetype == 'java'
		call append(8,"public class ".expand("%:r"))
		call append(9,"")
	endif
endfunction
"
" }}}


" Plugin configuration {{{
"
" ack.vim {{{
"   Ack searching and cope displaying
"   requires ack.vim - it's much better than vimgrep/grep
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

" auto-pairs {{{
" }}}

" ctrlp.vim {{{
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
" }}}

" indentLine {{{
" Vim
let g:indentLine_color_term = 239
" GVim
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '┊'
" let g:indentLine_char = '⇢'
" }}}

" javacomplete {{{
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd FileType java,javascript,jsp inoremap <buffer> . .<C-X><C-O><C-P><Down>
" autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
" autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
" }}}

" minibufexplorer.vim {{{
" toggle minibufexplorer
map <Leader>bl :MBEToggle<cr>
" buffer manage
map <Tab>   :MBEbn<cr>
map <S-Tab> :MBEbp<cr>
" }}}

" nerdtree {{{
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
map <Leader>nt :NERDTreeToggle<CR> 
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
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
nmap <silent> <leader>tb :TagbarToggle <CR>
" autocmd FileType java,cpp nested :TagbarOpen
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
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

" vim-markdown {{{
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
" }}}

" multiple-cursors {{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

" vim-snippets {{{
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

" YouCompleteMe {{{
nnoremap <leader>df :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" Do not ask when starting vim
let g:ycm_confirm_extra_conf=0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
let g:ycm_complete_in_comments=1
" }}}
"
" }}}

