""""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.0 - 13-14/01/2014
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Real _vimrc file of the personal vim configuration of Dr-Lord;
"       started from general tips and tricks gathered from use, research and
"       study of the best vimrcs found through it, and (hopefully) ending in a
"       complete configuration with asimptotically slowing evolution over time.


" All the following variables may be used in any of the sourced vimrcs

" This file's folder path
let $VIM_PATH="C:/Program Files (x86)/Vim/"
let $real_vimrc=$VIM_PATH."_vimrc"

" Repository's vimrc file path
let $REPO_PATH="C:/Users/Thomas/OneDrive/Programming/Vim/Vim/"
let $basic_vimrc=$REPO_PATH."basic_vimrc.vim"
let $extensions_vimrc=$REPO_PATH."extensions_vimrc.vim"

source $basic_vimrc
source $extensions_vimrc
