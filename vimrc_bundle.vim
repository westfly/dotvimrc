"""""""""""""""""""Configuration of Vundle"""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/workspace/dotvimrc/bundle/vundle
call vundle#rc('$HOME/workspace/dotvimrc/addon/')
Bundle 'gmarik/vundle'
filetype plugin indent on     " required!
filetype on
Bundle 'taglist.vim'
Bundle 'OmniCppComplete'
Bundle 'SuperTab'
Bundle 'vimwiki'
Bundle 'winmanager'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'FencView.vim'
Bundle 'Conque-Shell'
Bundle 'Vimpress'
Bundle 'Markdown'
"Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'c.vim'
Bundle 'a.vim'
Bundle 'grep.vim'
Bundle 'genutils'
Bundle 'snipMate'
Bundle 'Shell.vim'
Bundle 'bash-support.vim'
"can't load and point to vim-scripts
Bundle 'vim-scripts/stlref.vim'
Bundle 'vim-scripts/echofunc.vim'
Bundle 'vim-scripts/awk.vim'
