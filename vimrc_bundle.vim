"""""""""""""""""""Configuration of Dependence""""""""""""""
"package dependence:  ctags
""python dependence:  pep8, pyflake pylint
"""""""""""""""""""Configuration of Vundle"""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
" call vundle#rc('$HOME/.vim/bundle')
call vundle#rc()    " default
" vim plugin bundle control, command model
" :BundleInstall     install
" :BundleInstall!    update
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean       remove plugin not in list (warning)

Bundle 'gmarik/vundle'
filetype plugin indent on     " required!
filetype on
"""""""""""""Configure about vim GUI""""""""""
Bundle 'winmanager'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'ervandew/supertab'
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized
"reference 
""http://www.zlovezl.cn/articles/my-vim-plugins-for-python/
" Bundle 'godlygeek/csapprox'

Bundle 'tpope/vim-pathogen'
execute pathogen#infect()
Bundle 'scrooloose/syntastic'
" auto complete single or double quotation marks
Bundle 'Raimondi/delimitMate'
Bundle 'bling/vim-airline'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle 'Shougo/neocomplcache.vim'
""""""""""""""""""""""""""""""""""""""""""""""""
"               Tools 
""""""""""""""""""""""""""""""""""""""""""""""""
"让某些插件可以在后台干活（例如生成缓存，扫描文件夹）
"不会卡住vim的界面, vimshell 也依赖之
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
" sublime text中的ctrl-p一样，可以fuzzy地查找文件
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
""""""""""""""""""""""""""""""""""""""""""""""""
"                C/C++ 
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
let g:vim_markdown_folding_disabled=1
" supper than a.vim
Bundle 'derekwyatt/vim-fswitch'
""""""""""""""""""""""""""""""""""""""""""""""""
"                Python 
""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""
"                 Golang
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'jnwhiteh/vim-golang'
