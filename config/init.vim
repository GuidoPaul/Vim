" Neo/Vim Initialize Settings
" ---

let g:config = get(g:, 'config', {})

" Identify platform {{{
"
let g:config.os = {}
let g:config.os.mac = has('macunix')
let g:config.os.linux = has('unix') && !has('macunix') && !has('win32unix')
let g:config.os.windows = has('win32')
"
" }}}

" Define config {{{
"
let g:config.nvim = has('nvim') && exists('*jobwait') && !g:config.os.windows
let g:config.vim8 = exists('*job_start')
let g:config.gui = has('gui_running')
let g:config.timer = exists('*timer_start')
"
" }}}

" Neo/Vim plugin manager {{{
"
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Language Server | Completion, Formatting, Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Code-Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" syntax-checking
if g:config.vim8 || g:config.nvim
	Plug 'dense-analysis/ale'
else
	Plug 'vim-syntastic/syntastic'
endif

" fuzzy finder
Plug 'Yggdroot/LeaderF' " nvim needs pip install pynvim | needs nerd-fonts

" Code Formatting
"Plug 'sbdchd/neoformat'

" File System Explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Color-Scheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kien/rainbow_parentheses.vim'

" Sync sftp scp
Plug 'skywind3000/asyncrun.vim'
Plug 'eshion/vim-sync'

" Misc
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/BufOnly.vim'
Plug 'preservim/nerdcommenter'
Plug 'mcchrish/nnn.vim'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vista.vim' " tagbar

" Initialize plugin system
call plug#end()
"
" }}}

" vim: set ts=4 sw=4 tw=80 noet :
