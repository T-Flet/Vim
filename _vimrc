""""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       2.0 - 15/01/2014
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Real _vimrc file of the personal vim configuration of Dr-Lord.


" All the following variables may be used in any of the sourced vimrcs

" This file's folder path
let $VIM_PATH="C:/Program Files (x86)/Vim/"
let $real_vimrc=$VIM_PATH."_vimrc"

" Repository's vimrc file path
let $REPO_PATH="C:/Users/Thomas/OneDrive/Programming/Vim/Vim/"
let $basic_vimrc=$REPO_PATH."basic_vimrc.vim"
let $extensions_vimrc=$REPO_PATH."extensions_vimrc.vim"


let $familiar_mode_vimrc=$REPO_PATH."familiar_mode_vimrc.vim"

source $basic_vimrc
source $extensions_vimrc

source $familiar_mode_vimrc
