""""" INTRODUCTION """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.4 - 27-28/01/2014
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Real _vimrc file of the personal vim configuration of Dr-Lord.


" NOTE: All the following variables may be used in any of the sourced vimrcs

" MAKE THIS THE PATH OF THIS REPOSITORY'S FOLDER
" Make sure it ends with the path separator ( / )
let $REPO_PATH="C:/Users/Thomas/OneDrive/Programming/Vim/Vim/"


" Absolute paths to configuration files, generated from the two above paths
" $VIM is the Vim installation folder path
let $real_vimrc=$VIM."/_vimrc"

let $basic_vimrc=$REPO_PATH."basic_vimrc.vim"
let $advanced_vimrc=$REPO_PATH."advanced_vimrc.vim"
let $extensions_vimrc=$REPO_PATH."extensions_vimrc.vim"
let $filetypes_vimrc=$REPO_PATH."filetypes_vimrc.vim"
let $familiar_mode_vimrc=$REPO_PATH."familiar_mode_vimrc.vim"


" Source (execute/implement) specific configurations;
" uncomment lines as desired

" Basic Vim configuration
source $basic_vimrc
" Advanced Vim configuration features
source $advanced_vimrc
" "familiar" mappings
source $familiar_mode_vimrc
" Extensions configurations
source $extensions_vimrc
" Filetypes configurations
source $filetypes_vimrc
