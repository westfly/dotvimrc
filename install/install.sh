#!/bin/bash
curr_dir=`pwd -P`
vimfile="~/.vim"
vimconfig="~/.vimrc"
ln -s $curr_dir  $vimfile
echo -e "source $vimfile/vimrc_ares.vim\n" >> "$vimconfig"
echo -e "source $vimfile/vimrc_bundle.vim\n" >> "$vimconfig"
