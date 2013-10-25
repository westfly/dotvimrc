"""""""""""""""""""Configuration of Vundle"""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc('$HOME/.vim/addon/')
Bundle 'gmarik/vundle'
filetype plugin indent on     " required!
filetype on
"about ui
Bundle 'winmanager'
Bundle 'taglist.vim'
Bundle 'Tagbar'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'FencView.vim'
Bundle 'Conque-Shell'
"Bundle 'CSApprox'
"Auto Complete"
Bundle 'OmniCppComplete'
Bundle 'Shougo/neocomplcache'
Bundle 'rkulla/pydiction'

Bundle 'SuperTab'
Bundle 'vimwiki'
Bundle 'Vimpress'
Bundle 'Markdown'
"Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'c.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'a.vim'
Bundle 'grep.vim'
Bundle 'genutils'
Bundle 'snipMate'
Bundle 'Shell.vim'
Bundle 'bash-support.vim'
"can't load and point to vim-scripts
"Bundle 'vim-scripts/stlref.vim'
Bundle 'vim-scripts/echofunc.vim'
Bundle 'vim-scripts/awk.vim'
"thirdparty"
"Bundle 'uarun/vim-protobuf'
Bundle 'westfly/addon.vim'
