#!/bin/bash
curr_dir=`pwd`

vimfile="~/.vim"
oomtags_dir=$curr_dir/../oomtags
ln -s $oomtags_dir $vimfile/oomtags
oomdict_dir=$curr_dir/../oomtags
ln -s $oomdict_dir $vimfile/oomdict
