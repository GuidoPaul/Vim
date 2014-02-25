" VIM Configuration File
" Copyright: 
" Author: Bslin
"
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub

Bundle 'jiangmiao/auto-pairs'
Bundle 'Rip-Rip/clang_complete'
Bundle 'kien/ctrlp.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-commentary'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-surround'
"Bundle 'Valloric/YouCompleteMe'  (需vim7.4,暂时不安装)
 

" vim-scripts
Bundle 'bufexplorer.zip'
Bundle 'javacomplete'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" pathogen需要
execute pathogen#infect()   


" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI   " 启动时不显示援助乌干达儿童的提示  
set cursorline      " 高亮光标所在行 
set cursorcolumn    " 高亮光标所在列
syntax on           " 设置高亮
if has("gui_running")
	colorscheme ron
endif
" 设置字体和大小，有“\”
set guifont=YaHei\ Consolas\ Hybrid\ 12.5    
" set guifont=Courier_New:h10:cANSI 
" set guifont=monaco\ 11
" set guifont=Inconsolata\ 13
" set guifont=DejaVu\ Sans\ Mono\ 11
set scrolloff=3           " 光标移动到buffer的顶部和底部时保持3行距离  
" 显示中文
set fenc=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese
set encoding=utf-8 "if not set, the powerline plugins won't work
if has("win32") || has("win64")
    set fileencoding=chinese
endif
" set encoding=utf-8
" set langmenu=zh_CN.UTF-8
" language message zh_CN.UTF-8
" set termencoding=utf-8  " 显示编码
" set fileencoding=utf-8
" set fileencodings=ucs-bom,utf8,cp936,gb18030,big5,euc-jp,euc-kr,latinl
" let &termencoding=&encoding
" set helplang=cn
" set fenc=utf-8
" set iskeyword+=.
set autoread         " 设置当文件被改动时自动载入
set autowrite        " 自动保存
set autoindent       " 自动缩进
set cindent          " 自动C缩进
set ruler            " 打开状态栏标尺
set go=""            " 不要图形按钮,工具栏、菜单栏、滚动条
"set guioptions-=T   " 隐藏工具栏
"set guioptions-=m   " 隐藏菜单栏
set tabstop=4        " Tab键的宽度
set shiftwidth=4     " 缩进的空白长度
set softtabstop=4    " 统一缩进为4
set noexpandtab      " 不要用空格代替制表符
set smarttab         " 在行和段开始处使用制表符
set number           " 显示行号
set history=1000     " 历史记录数
set incsearch        " 即时查找
set hlsearch         " 匹配字符高亮显示
set ignorecase       " 搜索忽略大小写
set completeopt=preview,menu " 代码补全===================
" 将tab替换为空格
nmap tt :%s/\t/    /g<CR>
filetype on                 " 侦测文件类型
filetype indent on          " 为特定文件类型载入相关缩进文件
set viminfo+=!              " 保存全局变量
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set noerrorbells " 去掉输入错误的提示声音
set confirm      " 在处理未保存或只读文件的时候，弹出确认
set nobackup     " 禁止生成临时文件
set noswapfile   " 禁止用swapfile
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif



"set showcmd         " 输入的命令显示出来，看的清楚些(删)
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议) (删)
" 语言设置
" set langmenu=zh_CN.UTF-8 (删)



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
	" 如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#! /usr/bin/env/python")
        call append(line("."),"# -* - coding: UTF-8 -* -")
        call append(line(".")+1,"# Filename: ".expand("%"))
		call append(line(".")+2, "") 
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Bslin") 
		call append(line(".")+2, "	> Mail: Baoshenglin1994@gmail.com") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <cstdio>")
		call append(line(".")+7, "#include <iostream>")
		call append(line(".")+8, "using namespace std;")
		call append(line(".")+9, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
	endif
"	if &filetype == 'java'
"		call append(line(".")+6,"public class ".expand("%"))
"		call append(line(".")+7,"")
"	endif
	" 新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map! <C-O> <C-Y>,
" imap <C-k> <C-y>,
" imap <C-j> <ESC>
" map <C-w> <C-w>w
" set clipboard=unnamed
" 打开树状文件目录  
" map <C-F3> \be  
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
" set report=0
" 匹配括号高亮的时间（单位是十分之一秒）
" set matchtime=1
" 为C程序提供自动缩进
" 自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap (假)" (假)""<ESC>i
"":inoremap ' ''<ESC>i
""function! ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return (假)"\<Right>"
""	else
""		return a:char
""	endif
""endfunction

" 输入法
":let g:vimim_map='c-/'
":let g:vimim_cloud='sougou' " QQ云输入
":let g:vimim_punctuation=0	 " 不用中文标点
":set pastetoggle=<C-H>
":let g:vimim_cloud=-1



" F3 打开Tagbar
nmap <silent> <F3> :TagbarToggle <CR>
" \bf 打开BufExplorer
nmap <leader>bf :BufExplorer<cr>
" 缩小vim
map! <C-Z> <Esc>zzi
" 全文复制
map <C-A> ggVG$"+y
" 全文缩进
map <F12> gg=G
" 在源代码目录生成tags文件 Ctrl-] Ctrl-t
nmap cc :!ctags -R <CR><CR>
"生成一个cscope的数据库
nmap ff :!cscope -Rbq <CR><CR>
" 快捷键 F4 编译后，如有错误则打开quickfix窗口。（光标仍停留在源码窗口)
autocmd FileType c,cpp map <buffer> <F4> :w<cr>:make<cr><cr>
" 切换window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
" 插入模式下粘贴
imap <C-v> <Esc>"*pa
" 普通模式下粘贴
" map <C-v> "*pa<Esc>
" 输入模式下回到行首行尾
imap <C-a> <Esc>^
imap <C-e> <Esc>$
" 可以在buffer的任何地方使用鼠标
set mouse=a "全部模式下 set mouse=v 可视模式下
set selection=exclusive
set selectmode=mouse,key
" 去空行  
nnoremap <F9> :g/^\s*$/d<CR> 
" 比较文件  
nnoremap <C-F2> :vert diffsplit 
" F2列出/关闭当前目录文件  
map <F2> :NERDTreeToggle<CR> 
""""""""""""""""""""""""""""""
" 代码折叠
""""""""""""""""""""""""""""""
set foldenable              " 可使用折叠
set foldmethod=indent       " 设置缩进折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=3        " 设置折叠层数
set foldlevelstart=99       " 打开文件是默认不折叠代码
"set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠

" 按F5编译运行 C、C++、Java、sh、python、html、go、mkd
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
map <F5> :call CompileRunGcc()<CR>
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
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

" F8键C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!gcc % -g -o %<"
	exec "!gdb ./%<"
endfunc

" 代码格式优化
map <F6> :call FormartSrc()<CR><CR>
" 定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
" 结束定义FormartSrc

" markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
"nmap fi :!firefox %.htm & <CR><CR>
nmap fi :!firefox % & <CR><CR>


set linespace=0  "设置行距
set wildmenu     "增强模式中的命令行补全
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=indent,eol,start
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
set matchpairs+=<:>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" 
" NERD Tree
""""""""""""""""""""""""""""""
let NERDChristmasTree=1     " 让Tree把自己给装饰得多姿多彩漂亮点 
let NERDTreeMinimalUI=1     " 不显示帮助面板
let NERDTreeWinSize=25      " 显示Tree的宽度
" F2列出/关闭当前目录文件  
" map <F2> :NERDTreeToggle<CR> 
" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""" 
" Tagbar
"""""""""""""""""""""""""""""" 
let Tlist_Use_Right_Window = 1
nmap <silent> <leader>ta :TagbarToggle <CR>
" nmap <silent> <F3> :TagbarToggle <CR>
" leader 相当于反斜杠
" silent 命令行不显示
let g:tagbar_width=25
"打开vim时自动打开tagbar
"autocmd VimEnter * nested :call tagbar#autoopen(1) 

" 在源代码目录生成tags文件 Ctrl-] Ctrl-t
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
nmap cc :!ctags -R <CR><CR>

"""""""""""""""""""""""""""""" 
" syntastic 语法检查
"""""""""""""""""""""""""""""" 
let g:syntastic_check_on_open = 1      " 打开就检查
let g:syntastic_error_symbol = '✗'     " 错误提示标记
let g:syntastic_warning_symbol = '⚠'   " 警告提示标记
let g:syntastic_auto_loc_list = 1      " 打开Location_List
let g:syntastic_loc_list_height = 5    " Location_List高度
" let g:syntastic_enable_highlighting = 0  " 错误不高亮

"""""""""""""""""""""""""""""" 
" vim-commentary:注释
"""""""""""""""""""""""""""""" 
" \\\  注释一行
" gcc  注释一行 
" gc   可视模式（v）注释
" gcap 注释段落

"""""""""""""""""""""""""""""" 
" ctrlp
"""""""""""""""""""""""""""""" 
let g:ctrlp_map = ',,'  " ,, 打开ctrlp
let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

" <c-f> && <c-d> && <c-r> 切换查找模式
" <c-j> && <c-k> && <c-z> 选择、选定文件
" <c-t> && <c-v> && <c-x> && <c-o> 打开选定文件
" <c-y> 创建新文件

"""""""""""""""""""""""""""""" 
" surround 外套
"""""""""""""""""""""""""""""" 
" w代表word, W代表WORD(被空格分开的连续的字符窜），p代表paragraph
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

" CTRL-si[ ci( ci< ci{ 删除一对 [], (), <>, 或{} 中的所有字符并进入插入模式
" ci” ci’ ci` 删除一对引号字符 ”  ‘ 或 ` 中所有字符并进入插入模式
" cit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式

"""""""""""""""""""""""""""""" 
" BufExplorer
""""""""""""""""""""""""""""""
" nmap <leader>bf :BufExplorer<cr>
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=1        " Split right.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
" let g:bufExplorerSplitVertSize = 30  " Split width
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"""""""""""""""""""""""""""""" 
" Tag_list 
"""""""""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
let Tlist_Auto_Open=0               " 默认打开Taglist 
let Tlist_Compart_Format = 1        " 压缩方式  
"let Tlist_Enable_Fold_Column = 0   " 不要显示折叠树  
let Tlist_Exit_OnlyWindow = 1       " 如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_File_Fold_Auto_Close = 1  " 让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_Show_One_File = 1         " 只显示当前文件的taglist，默认是显示多个
let Tlist_Sort_Type = "name"        " 按照名称排序  
let Tlist_Use_Right_Window = 1      " 在右侧窗口中显示taglist窗口
" 打开Tag list
":nmap <silent> <F3> <ESC>:Tlist<RETURN>


"""""""""""""""""""""""""""""" 
" ultisnips
"""""""""""""""""""""""""""""" 
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsJumpForwardTrigger="<c-j>"   " 下一处
let g:UltiSnipsJumpBackwardTrigger="<c-k>"  " 上一处

"""""""""""""""""""""""""""""" 
" clang_complete (需要可用的clang)
"""""""""""""""""""""""""""""" 
let g:clang_complete_copen=1       "open quickfix window on error
" let g:clang_periodic_quickfix=1    "periodically(周期性) update the quickfix window
let g:clang_snippets=1
let g:clang_close_preview=1        "close automatically after a completion
let g:clang_use_library=1
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'  


"""""""""""""""""""""""""""""" 
" javacomplete
"""""""""""""""""""""""""""""" 
autocmd Filetype java set omnifunc=javacomplete#Complete "java自动补全
" autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo "java参数提示
" "."映射出窗口
autocmd FileType java,javascript,jsp inoremap <buffer> . .<C-X><C-O><C-P><Down>
" autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>


"""""""""""""""""""""""""""""" 
" phpcomplete
"""""""""""""""""""""""""""""" 
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP "php自动补全

"""""""""""""""""""""""""""""" 
" neocomplcache 
"""""""""""""""""""""""""""""" 
let g:neocomplcache_enable_at_startup = 1    "可使用neo"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"  "关闭，删最后一个
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"   "关闭，删最后一个
inoremap <expr><C-Y> neocomplcache#close_popup()   " 默认ctrl-y关闭菜单
inoremap <expr><C-e> neocomplcache#cancel_popup()  " 默认ctrl-e取消选择
"<TAB>: completion. NO USE with snipmate 取消 <TAB> 的相关映射(有也没作用)
" inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
"如果有neo菜单，赋予 <Enter>, <C-Y> 的功能
inoremap <expr><Enter> pumvisible() ? "\<C-Y>" : "\<Enter>"
" pumvisible() 如果弹出菜单可见,返回非零,不然返回零.
" 效果1:有匹配项,则会自动弹出菜单,可利用<C-P> <C-N>选择,通过<Enter>来确定,且无换行.
" 效果2:当有snippets可被匹配时,按下<TAB>,大段代码段依旧可被替换,不受neo影响.

" :help neocomplcache-faq (取消clang与neo冲突)
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

"""""""""""""""""""""""""""""" 
" indentline
"""""""""""""""""""""""""""""" 
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
" let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '│'

"""""""""""""""""""""""""""""" 
" airline
"""""""""""""""""""""""""""""" 
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   " 状态行显示的内容  
set laststatus=2     " 启动显示状态行(1),总是显示状态行(2)  
let g:airline_theme='powerlineish'
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_left_sep=''
let g:airline_right_sep=''

"""""""""""""""""""""""""""""" 
" multiple-cursors
"""""""""""""""""""""""""""""" 
" Ctrl-n     select


"""""""""""""""""""""""""""""" 
" supertab (已删)
"""""""""""""""""""""""""""""" 
" let g:SuperTabDefaultCompletionType="context"
" let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" let g:SuperTabRetainCompletionType=0


"""""""""""""""""""""""""""""" 
" Cscope(已删)
"""""""""""""""""""""""""""""" 
" Ctrl+g 查找该对象的定义
" nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR><C-w>
" nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR><C-w>
" nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR><C-w>
" nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR><C-w>
" nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR><C-w>
" nmap <C-i> :cs find i <C-R>=expand("<cfile>")<CR><CR><C-w>
" nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR><C-w>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR><C-w>
"nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR><C-w>
" 开启quickefix模式
set cscopequickfix=s-,c-,d-,i-,t-,e-
set makeprg=g++\ -o\ %<\ %\ -Wall\ -g 
set makeprg=make\ %< 
let g:exQF_window_height = 30 "限制高度为30
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
" 快捷键 F4 编译后，如有错误则打开quickfix窗口。（光标仍停留在源码窗口)
autocmd FileType c,cpp map <buffer> <F4> :w<cr>:make<cr><cr>
" 注意：需要开启netsting autocmd
autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow
" quickfix模式(使用上面的)
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"""""""""""""""""""""""""""""" 
" minibufexpl(已删)
"""""""""""""""""""""""""""""" 
let g:miniBufExplMapWindowNavVim = 1    " 可用<C-h,j,k,l>切换到上下左右的窗口
let g:miniBufExplMapWindowNavArrows = 1 " 可用<C-箭头键>切换到上下左右的窗口
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  

"""""""""""""""""""""""""""""" 
" Winmanager (安装注意)(已删)
"""""""""""""""""""""""""""""" 
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"  
let g:winManagerWidth = 25
  
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction  
  
nmap wm :WMToggle<CR>  


" python补全
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
autocmd FileType python set omnifunc=pythoncomplete#Complete




