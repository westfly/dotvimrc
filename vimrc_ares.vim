"------------------------------------
"         基本设置
"------------------------------------
set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
set number                  " 显示行号
set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺

set wrap					          " Wrap lines
set shiftwidth=2            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=2           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=2               " 设定 tab 长度为 2
set autoindent				      " auto indent
set expandtab
set mouse=a					        " Have the mouse enabled all the time:
set nobackup                " 覆盖文件时不备份
set autoread				        " Set to auto read when a file is changed from the outside
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

"set wildmenu				"Turn on WiLd menu
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息
							
"""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax enable

"set colorscheme
"colorscheme elflord
"colorscheme molokai
"colorscheme desert
"colorscheme solarized
"endif

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
		 set langmenu=none	"设置英文菜单，貌似无效哦
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

							
"""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""							
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
"set foldmethod=indent      " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=100      " 设置折叠层数为
"set foldclose=all          " 设置为自动关闭折叠                            
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠					
"""""""""""""""""""""""""""""""""""""
" Tlist Configuration  taglist.vim
"""""""""""""""""""""""""""""""""""""
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1

if has("win32")
	let Tlist_Ctags_Cmd=$VIMRUNTIME.'/ctags.exe'
else
	let Tlist_Ctags_Cmd='/usr/bin/ctags'
endif
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window=1
let Tlist_Process_File_Always=1     "Always Process File
let Tlist_Auto_Open=0               "Open Tlist when vim start
let Tlist_Enable_Fold_Column=1        
let Tlist_Exit_OnlyWindow=1         "If only Tlist window works, vim exit.
let Tlist_Sort_Type="name"          "sort by name
let Tlist_Show_One_File=1

" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle
"map <F4> :TlistToggle<cr>
set tags=tags;						" 在当前目录以及所有上层目录中寻找tags文件
let AresTagHome=$VIMFILES.'/oomtags'
set tags+=~/.vim/oomtags/cpp_stl_tags
"快捷键更新
map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
"""""""""""""""""""""""""""""""""""""
" winManager setting
"""""""""""""""""""""""""""""""""""""
let g:AutoOpenWinManager = 1
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWindowLayout = "NERDTree|TagList,BufExplorer"
let g:winManagerWindowLayout = "NERDTree,BufExplorer"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30 
"定义打开关闭winmanager按键
nmap wm :WMToggle<cr>
"""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""
nmap <Leader>tb :TagbarToggle<CR>
map <F6> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"""""""""""""""""""""""""""""""""""""
" 开启自动完成
"""""""""""""""""""""""""""""""""""""
filetype plugin on  
autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete  						
"""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""
autocmd FileType python set tabstop=2 shiftwidth=2 expandtab
" 设置python折叠
autocmd FileType python set foldmethod=indent
" F12快捷键  执行Python程序
autocmd FileType python map <F12> :!python %<CR>

"pydict 字典位置设定
let g:pydiction_location='$VIMFILES./oomdict/pydiction/complete-dict'

"""""""""""""""""""""""""""""""""""""
" python.vim python3.0.vim
" place in syntax
"""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""
"   python_fn.vim
"   place in ftplugin
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
"   pydoc.vim
"   place in plugin
"   \pW来查询光标所在的词相对应的API
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
"   pyflakes.vim
"   place in ftplugin/python
"   :cc to check ——confict with 
"""""""""""""""""""""""""""""""""""""""
function CompileRun()
	exec "w"
	if &filetype=='c'
		exec "!gcc % -g o %<"
		exec "!.\/%<"
	elseif &filetype=='cpp'
		exec "!sudo ymake %<"
		exec "!.\/%<"
	elseif &filetype=='cpp'
		exec "!g++ % -g -o %<"
		exec "!.\/%<"
	elseif &filetype=='python'
		exec "!python %"
	endif
endfunction
map <F9> :w<CR>:call CompileRun()<CR>

"""""""""""""""""""""""""""""""""""""
" C/C++
"""""""""""""""""""""""""""""""""""""
"-- omnicppcomplete setting --
" 按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
"imap <F3> <C-X><C-O>
" 按下F2根据头文件内关键字补全
"imap <C-x> <C-X><C-I>
set completeopt=longest,menu,menuone  " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1        " autocomplete with .
let OmniCpp_MayCompleteArrow = 1      " autocomplete with ->
let OmniCpp_MayCompleteScope = 1      " autocomplete with ::
let OmniCpp_SelectFirstItem = 2       " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2       " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1   " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1       " enable the global scope search
let OmniCpp_DisplayMode=1             " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1         " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 
"""""""""""""""""""""""""""""""""""""
" gtags.vim 
"""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""
" cscope_tag.vim 
"""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  set cscopetag
  set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
  "cs add ~/coding_np/cscope.out
endif

"""""""""""""""""""""""""""""""""""""
" supertab.vim 
"""""""""""""""""""""""""""""""""""""
"let g:SuperTabDefaultCompletionType="context"
"-----------------------------------------------------------------
" plugin –CRefVim :  
" a C-reference manual especially designed for Vim
"-----------------------------------------------------------------
"<Leader>cr normal mode:  get help for word under cursor
"					   	  Memory aid cr: (c)-(r)eference
"<Leader>cr visual mode:  get help for visually selected text
"					   	  Memory aid cr: (c)-(r)eference
"<Leader>cw:              prompt for word CRefVim should search for
"					   	  Memory aid cw: (c)-reference (w)hat
"<Leader>cf:              jump to table of contents of the C-reference manual
"					   	  Memory aid cc: (c)-reference (c)ontents
"					      修改了源码，绑定到cf热键上
"nnoremap <cf> <leader>cc

								
"-----------------------------------------------------------------
" Bash  
"-----------------------------------------------------------------
let g:BASH_AuthorName   = 'Ares Young'
let g:BASH_Email        = 'yweiyun@163.com'
let g:BASH_Company      = 'Free Inc'


"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m  mark or unmark the word under (or before) the cursor
" \r  manually input a regular expression. 用于搜索.
" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \*  当前MarkWord的下一个     \#  当前MarkWord的上一个
" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个
"-----------------------------------------------------------------
nmap <silent> <leader>hl	<Plug>MarkSet
vmap <silent> <leader>hl 	<Plug>MarkSet
nmap <silent> <leader>hh	<Plug>MarkClear
vmap <silent> <leader>hh 	<Plug>MarkClear
nmap <silent> <leader>hr 	<Plug>MarkRegex
vmap <silent> <leader>hr 	<Plug>MarkRegex

"-----------------------------------------------------------------
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"-----------------------------------------------------------------
"-----------------------------------------------------------------
" stlref.vim
"-----------------------------------------------------------------
"-----------------------------------------------------------------
" echofunc.vim 
"-----------------------------------------------------------------

"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" [count]<leader>cc 光标以下count行逐行添加注释(7,cc)
" [count]<leader>cu 光标以下count行逐行取消注释(7,cu)
" [count]<leader>cm 光标以下count行尝试添加块注释(7,cm)
" 			  <leader>cA 在行尾插入 /* */,并且进入插入模式。
" 				这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=0       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
let NERDShutUp=1			" 支持单行和多行的选择


"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :NERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F4> :NERDTreeToggle<CR>
"imap <F3> <ESC>:NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""
" 为shell自动添加可执行权限
"""""""""""""""""""""""""""""""""""""
function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
        silent !chmod a+x <afile>
    endif
  endif
endfunction
au BufWritePost * call ModeChange()



"-----------------------------------------------------------------
" 自动匹配
"-----------------------------------------------------------------
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap ( ()<ESC>i
:inoremap { {<CR>}<ESC>i
":inoremap { {<CR>}<ESC>ba<CR>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function ClosePair(char)
    if getline('.')[col('.')-1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
"-----------------------------------------------------------------
" 一些有用的快捷键 
"-----------------------------------------------------------------
"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
"与MiniBuffer中对应
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w> <C-w>w			"后一个
nnoremap <C-p> <C-w>p			"前一个

nnoremap <C-v> <C-w>v			"split horizontally
"nnoremap <C-o> <C-w>l			"关闭其它窗口
"关于tab的快捷键
map tn :tabnext<CR>
map tp :tabprevious<CR>
map td :tabnew .<CR>
map te :tabedit
map tc :tabclose<CR>
" 默认的快捷键
":tabe fn在一个新的标签页中编辑文件fn
"gt切换到下一个标签页
"gT切换到上一个标签页
":tabr切换到第一个标签页
":table换到最后一个标签页:tabm [N]tabm当前ab后
"


" MiniBuffers操作快捷方式!
"nnoremap <C-RETURN> :bnext<CR>
"nnoremap <C-S-RETURN> :bprevious<CR>
map bn :bnext<CR>
map bp :bprevious<CR>

"""""""""""""""""""""""""""""""""""""
" neocomplcache.vim
"""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
"使用空格作为自动完成的标志"
inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
"""""""""""""""""""""""""""""""""""""
" thrift.vim
"""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim
"""""""""""""""""""""""""""""""""""""
" blade.vim
"""""""""""""""""""""""""""""""""""""
function! Blade(...)
  let l:old_makeprg = &makeprg
  setlocal makeprg=ymake_quickfix
  setlocal efm=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m
  execute "make " . join(a:000)
   let &makeprg=old_makeprg
endfunction
command! -complete=dir -nargs=* Blade call Blade('<args>')    "将函数调用绑定到vim命令
"let mapleader = ","
""autocmd filetype c,cc,cpp map <buffer> <leader>c <esc>:w<cr>:Blade<cr>
"autocmd filetype c,cc,cpp map <buffer> <leader>c <esc>:ymake<cr>       "键绑定

"""""""""""""""""""""""""""""""""""""
" javascript.vim
"""""""""""""""""""""""""""""""""""""
" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
"DoxygenToolkit"
" DoxLic generate licence
" DoxAuthor generate version & author & file
" Dox generate function description
let g:doxygenToolkit_authorName="Ares Young"
let s:licenseTag="Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag."Google \<enter>"
let s:licenseTag = s:licenseTag."All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag"
let g:doxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
" slime.vim
"let g:slimv_swank_cmd ='! xterm -e sbcl --load /home/yang/.vim/slime/start-swank.lisp &'
"let g:paredit_mode=0

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
