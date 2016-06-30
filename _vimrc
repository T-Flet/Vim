""""" INTRODUCTION """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.6 - 30/06/2016
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Real _vimrc or .vimrc file of the personal vim configuration of Dr-Lord,
"       which imports the desired sub-vimrc files.


" NOTE: All the following variables may be used in any of the sourced vimrcs

" MAKE THIS THE PATH OF THIS REPOSITORY'S FOLDER
" Make sure it ends with the path separator ( / )
let $REPO_PATH="INSERT THIS REPOSITORY'S PATH HERE!!!!"


" Absolute paths to configuration files, generated from the two above paths
" Might be useful:
"   $VIM is the Vim installation folder path
"   On Windows %USERPROFILE% is the equivalent of $HOME on Linux
let $real_vimrc=$HOME."/.vimrc"
"let $real_vimrc=$VIM."/_vimrc"

let $main_vimrc=$REPO_PATH."main_vimrc.vim"
let $advanced_vimrc=$REPO_PATH."advanced_vimrc.vim"
let $filetypes_vimrc=$REPO_PATH."filetypes_vimrc.vim"
let $extensions_vimrc=$REPO_PATH."extensions_vimrc.vim"
let $familiar_mode_vimrc=$REPO_PATH."familiar_mode_vimrc.vim"
let $theme_vimrc=$REPO_PATH."theme_vimrc.vim"


" Source (execute/implement) specific configurations;
" uncomment lines as desired

" main Vim configuration
source $main_vimrc
" Advanced Vim configuration features
source $advanced_vimrc
" Filetypes configurations
"source $filetypes_vimrc
" Extensions configurations
"source $extensions_vimrc
" "familiar" mappings
source $familiar_mode_vimrc
" Theme (text and colours) configurations
source $theme_vimrc
