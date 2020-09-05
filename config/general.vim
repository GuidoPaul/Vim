" Neo/Vim General Settings
" ===

" General {{{
"
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

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
set cmdheight=2

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
" set colorcolumn=80
set colorcolumn=120
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

colorscheme desert

" Set extra options when running in GUI mode
if g:config.gui
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
    if g:config.os.linux
		set guifont=Inconsolata\ for\ Powerline\ 12
    elseif g:config.os.mac
        "set guifont=Inconsolata\ for\ Powerline:h13.5
        set guifont=Inconsolata\ Regular\ Nerd\ Font\ Complete\ Mono:h13.5

    endif
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
set nowritebackup
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
set undodir=~/.vim/undo
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
set autoread     " Set to auto read when a file is changed from the outside
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
set foldmethod=indent
" autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | silent mkview | endif
" autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | endif
"set foldtext=MyFoldText()

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

" Close all buffers
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

" vim: ts=4 sw=4 tw=80 noet :
