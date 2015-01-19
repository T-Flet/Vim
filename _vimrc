""""" INTRODUCTION """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.2 - 18-19/01/2014
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Real _vimrc file of the personal vim configuration of Dr-Lord.


" NOTE: All the following variables may be used in any of the sourced vimrcs

"" MAIN PATHS:
" MAKE THIS THE PATH OF YOUR VIM INSTALLATION FOLDER
let $VIM_PATH="C:/Program Files (x86)/Vim/"
" MAKE THIS THE PATH OF THIS REPOSITORY'S FOLDER
let $REPO_PATH="C:/Users/Thomas/OneDrive/Programming/Vim/Vim/"


" Absolute paths to configuration files, generated from the two above paths
let $real_vimrc=$VIM_PATH."_vimrc"

let $basic_vimrc=$REPO_PATH."basic_vimrc.vim"
let $extensions_vimrc=$REPO_PATH."extensions_vimrc.vim"
let $familiar_mode_vimrc=$REPO_PATH."familiar_mode_vimrc.vim"


" Source (execute/implement) specific configurations;
" uncomment lines as desired

" Basic Vim configuration
source $basic_vimrc
" "familiar" mappings
source $familiar_mode_vimrc
" Extensions configurations
source $extensions_vimrc
