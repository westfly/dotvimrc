"--------------------------------------------------------
"                     基本设置                          |
"--------------------------------------------------------
set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
set number                  " 显示行号
set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺

set wrap		                " Wrap lines
set shiftwidth=2            " 设定 << 和 >> 命令移动时的宽度为 2
set softtabstop=2           " 使得按退格键时可以一次删掉2 个空格
set tabstop=2               " 设定 tab 长度为 2
set autoindent		          " auto indent
set expandtab
set mouse=a		              " Have the mouse enabled all the time:
set nobackup                " 覆盖文件时不备份
set autoread		            " auto read when file changed outside
"set autowrite

set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启插件
filetype on					        " 检测文件的类型
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax enable
if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
  set t_Co=256
else
  set t_Co=88
endif

" set colorscheme
" colorscheme solarized
" colorscheme desert

" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif
" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
" 设置字体 以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif
" 配置多语言环境
if has("multi_byte")
  " Set fileencoding priority
  if getfsize(expand("%")) > 0
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
  else
    set fileencodings=cp936,big5,euc-jp,euc-kr,latin1
  endif
    " UTF-8 编码
  set encoding=utf-8
  set termencoding=utf-8
  set formatoptions+=mM
  set fencs=utf-8,gbk
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
    set helplang=cn
  endif
  if has("win32")
    "source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "language messages zh_CN.utf-8
    language messages en_US.utf-8
    set langmenu=none  "设置英文菜单，貌似无效哦
  endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
if has("win32")
  let Tlist_Ctags_Cmd=$VIMRUNTIME.'/ctags.exe'
else
  let Tlist_Ctags_Cmd='/usr/bin/ctags'
endif

"-----------------------------------------------------------------
" MiniBuffers操作快捷方式!
"nnoremap <C-RETURN> :bnext<CR>
"nnoremap <C-S-RETURN> :bprevious<CR>
map bn :bnext<CR>
map bp :bprevious<CR>
"与MiniBuffer中对应
nnoremap <C-h> <C-w>h     "
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w> <C-w>w     "后一个
nnoremap <C-p> <C-w>p     "前一个
nnoremap <C-v> <C-w>v     "split horizontally
nnoremap <C-o> <C-w>l     "关闭其它窗口
"关于tab的快捷键
map tn :tabnext<CR>
map tp :tabprevious<CR>
map td :tabnew .<CR>
map te :tabedit
map tc :tabclose<CR>
"-----------------------------------------------------------------
"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :NERDtree 打开NERD_tree        :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
map <leader>n <plug>NERDTreeTabsToggle <CR>
" plugin - NERD_commenter.vim   注释代码用的，
" " [count]<leader>cc 光标以下count行逐行添加注释(7,cc)
" " [count]<leader>cu 光标以下count行逐行取消注释(7,cu)
" " [count]<leader>cm 光标以下count行尝试添加块注释(7,cm)
" " <leader>cuA 在行尾插入 /* */,并且进入插入模式。
" " 注：count参数可选，无则默认为选中行或当前行
let NERDSpaceDelims=0       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
let NERDShutUp=1            " 支持单行和多行的选择

"""""""""""""""""""""""""""""""""""""
" neocomplcache.vim
"""""""""""""""""""""""""""""""""""""
" http://legendmohe.net/2013/12/20/%E6%88%91%E7%9A%84vim%E9%85%8D%E7%BD%AE/
" Use neocomplcache.
let g:acp_enableAtStartup             = 0
let g:neocomplcache_enable_at_startup = 0 "最好关闭，要不提示太频繁
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.go = '\h\w*\.'

""""""""""""""""""""""""""""""""""""
" Syntastic setting
""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
"""""""""""""""""""""""""""""""""""""
" Winmanager
"""""""""""""""""""""""""""""""""""""
nmap wm :WMToggle<cr>
"""""""""""""""""""""""""""""""""""""
" Tagbar setting
"""""""""""""""""""""""""""""""""""""
nmap <leader>tb :TagbarToggle<CR>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
""""""""""""""""""""
" Ctrlp setting
""""""""""""""""""""""
nnoremap <silent> <leader>h :CtrlPMRU<cr>
nnoremap <silent> <leader>p :CtrlP<cr>

""""""""""""""""""""
" airline setting
"""""""""""""""""""""
set laststatus=2
let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:airline_theme                      = "bubblegum" "设定主题
"
"
autocmd BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = './,./include,../include'
au BufEnter *.cc let b:fswitchdst = 'hh,h' | let b:fswitchlocs = './include,./,../include'
au BufEnter *.hh let b:fswitchdst = 'cc,cpp' | let b:fswitchlocs = '../,./'
au BufEnter *.h let b:fswitchdst = 'cpp,cc' | let b:fswitchlocs = './,../'
" 用分号代替冒号作为命令
nnoremap ; :
function AddExecuteMode()
  if getline(1) =~ "^#!/bin/*"
    silent !chmod a+x <afile>
  endif
endfunction
au BufWritePost * call AddExecuteMode()
"from http://ppwwyyxx.com/misc/vim.html
func HighlightFunctionsAndClasses()
    " syn match cCustomFunc      "\w\+\s*\((\)\@="
    " hi def link cCustomFunc      Function
    syn match cCustomClass     "\w\+\s*\(::\)\@="
    hi def link cCustomClass     cppType
endfunc
func DeleteTrailingWhiteSpace()
    normal mZ
    %s/\s\+$//e
    normal `Z
endfunc
au BufWrite * if &ft != 'mkd' | call DeleteTrailingWhiteSpace() | endif

au Syntax * call HighlightFunctionsAndClasses()

func Make()                        " silent make with quickfix window popup
    if &ft == 'cpp'
        if filereadable(getcwd() . "/Makefile")
            let &makeprg="make"
        elseif  filereadable(getcwd() . "/../Makefile")
            let &makeprg="make -C .."
        endif
    endif
    make
    " silent make ?
    redraw!
    for i in getqflist()
        if i['valid']
            cwin | winc p | return
        endif
    endfor
endfunc

func FindMakefile()
    exec "cd " . expand ("%:p:h")
    while ! filereadable(getcwd() . "/Makefile") && getcwd () != "/"
        cd ..
    endw
    :!make
endfunc
au Filetype gnuplot let &makeprg="gnuplot % ; feh ./*"
au Filetype dot let &makeprg="dot -Tpng -O -v % ; feh %.png"
au Filetype php let &makeprg="php %"
au Filetype r let &makeprg="R <% --vanilla"
func InstantRun()
    if &ft == 'python'
        if matchstr(getline(1), 'python2') == ""
            :!python %
        else | :!python2 %
        endif
    elseif &ft == 'ruby' | :!ruby %
    elseif &ft == 'sh' | :!bash %
    elseif &ft == 'cpp' | :!gdb -tui %<
    elseif &ft == 'java' | :! java %<
    elseif &ft == 'javascript' | :! node %
    elseif &ft == 'coffee' | :! coffee %
    else | call Make() | endif
endfunc
nnoremap <Leader>rr :call InstantRun() <CR>
nnoremap <Leader>mk :call Make()<CR>
nnoremap <Leader>mr :!make run <CR>
nnoremap <Leader>make :call FindMakefile()<CR>
"""""
let g:snips_author="yweiyun@gmail.com"
let g:snips_company="Free Inc"
