" Neo/Vim Plugin Settings
" ---

" coc.nvim {{{
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" coc-explorer
nmap <space>e :CocCommand explorer<CR>
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" }}}

" ale {{{
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 0
let g:ale_open_list = 0
let g:ale_fix_on_save = 1
let g:ale_fix_on_save_ignore = { 'vue': ['eslint'] }
let g:ale_echo_delay = 100
let g:ale_lint_delay = 1000
let g:ale_echo_msg_format = '%linter%: %code: %%s [%severity%]'
let g:ale_history_enabled = 0
let g:ale_maximum_file_size = 500000

let g:ale_linters = {'scss': [], 'javascript': ['eslint'], 'json': ['jsonlint'], 'php':['php'], 'python': ['flake8'], 'html':['htmlhint'], 'vue': []}
let g:ale_fixers = {'scss': ['prettier'], 'javascript': ['eslint'], 'json': ['jq'], 'python': [], 'vue': []}
let g:ale_html_htmlhint_options = '-c ~/.htmlhintrc --format=unix'
let g:ale_python_pyls_config = {
	\   'pyls': {
	\     'pycodestyle': { 'enabled': v:false },
	\     'configurationSources': ['flake8']
	\   }
	\ }
let g:ale_python_flake8_options = '--max-line-length=120 --ignore=E203'

let g:ale_sign_error = '✖'
let g:ale_sign_warning = 'ⁱ'

nmap gh <Plug>(ale_hover)
nmap <leader>aa <Plug>(ale_detail)
nmap <space>af <Plug>(ale_fix)
nmap <space>ar <Plug>(ale_find_references)
nmap <space>ad <Plug>(ale_go_to_definition)
nmap <space>aD <Plug>(ale_documentation)
nmap <space>an <Plug>(ale_next)
nmap <space>ap <Plug>(ale_previous)
" }}}

" LeaderF {{{
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
" Show icons, icons are shown by default
"let g:Lf_ShowDevIcons = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Inconsolata for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" If needs
"set ambiwidth=double
" }}}

" nerdtree {{{
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
map <leader>nt :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" nerdtree-git-plugin {{{
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}

" vim-signify {{{
" default updatetime 4000ms is not good for async update
set updatetime=100
" }}}

" dracula {{{
if g:config.gui
	colorscheme dracula
    let g:dracula_italic = 1
endif
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

" vim-sync {{{
autocmd BufWritePost * :call SyncUploadFile()
map <leader>sd :call SyncDownloadFile()
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

" indentLine {{{
let g:indentLine_setColors = 1
" Vim
let g:indentLine_color_term = 239
" GVim
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '¦'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_char = '⇢'
"let g:indentLine_concealcursor = ''
"let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 2
" }}}

" BufOnly.vim {{{
" Close all buffers but this one
map <leader>bo :Bufonly<cr>
" }}}

" nerdcommenter {{{
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
" }}}

" nnn.vim {{{
let g:nnn#command = 'nnn -d'
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
" }}}

" vim-airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nnoremap <Tab>   :bnext<cr>
nnoremap <S-Tab> :bprev<cr>
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
map <leader><leader>h <Plug>(easymotion-linebackward)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>. <Plug>(easymotion-repeat)
" }}}

" vista.vim {{{
nmap <silent> <F9> :Vista!! <cr>
let g:vista#renderer#enable_icon = 1
let g:vista_echo_cursor_strategy = 'scroll'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_executive_for = {
	\ 'vimwiki': 'markdown',
	\ 'pandoc': 'markdown',
	\ 'markdown': 'toc',
	\ }
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" }}}

" vim: set ts=4 sw=4 tw=80 noet :
