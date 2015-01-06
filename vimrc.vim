"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       0.1 - 05/01/2014
"
"   Description:
"       Personal vim configuration file of Dr-Lord; started from general tips
"       and tricks gathered from use, research and study of the best vimrcs
"       found through it, and (hopefully) ending in a totally complete
"       configuration with asimptotically slowing evolution over time.
"
"   Sections:
"       Features
"       Must Have Options
"       Usability Options
"       Indentation Options
"       Font and Text
"       Mappings


"""" BASICS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ward off unexpected things and sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine file type from name and possibly contents, which
" allows intelligent auto-indenting and filetype specific plugins.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"""" STARTUP OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Set initial folder and window size from shortcut or through commands

" Change directory
"cd FOLDER

" Maximise on Startup (for Windows)
"au GUIEnter * simalt ~x


"""" MUST HAVE OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Hilight search results
set hlsearch

" Modelines have historically been a source of security vulnerabilities.
" Disable them and use secure script:
" http://www.vim.org/scripts/script.php?script_id=1876
set nomodeline


"""" USABILITY OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


"""" INDENTATION OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation settings for using 4 spaces instead of tabs.
" Use :retab to convert all tabs in a file under these settings.
set shiftwidth=4
set softtabstop=4
set expandtab


"""" FONT AND TEXT """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Font size
:set guifont=Lucida_Sans_Typewriter:h18:cANSI


"""" MAPPINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
