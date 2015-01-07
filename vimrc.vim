"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       0.2 - 05/01/2014
"
"   Description:
"       Personal vim configuration file of Dr-Lord; started from general tips
"       and tricks gathered from use, research and study of the best vimrcs
"       found through it, and (hopefully) ending in a totally complete
"       configuration with asimptotically slowing evolution over time.
"
"   Sections:
"       Basics
"       Startup Options
"       User Interface
"       Usability Options
"       Indentation Options
"       Font and Text
"       Mappings
"       Miscellaneous Options


"""" BASICS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ward off unexpected things and sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine file type from name and possibly contents, which
" allows intelligent auto-indenting and filetype specific plugins.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Set "," as map leader, allowing extra key combinations
let mapleader = ","
let g:mapleader = ","

"""" STARTUP OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Set initial folder and window size from shortcut or through commands

" Change directory
"cd FOLDER

" Maximise on Startup (for Windows)
"au GUIEnter * simalt ~x


"""" USER INTERFACE """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make abandoned buffers hidden, and generate a single undo history for all
set hidden

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
" Show partial commands in the last line of the screen
set showcmd
" Better command-line completion
set wildmenu

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Display line numbers on the left
set number
" Always display the status line, even if only one window is displayed
set laststatus=2

" Hilight search results
set hlsearch
" Hilight search results as the search is typed
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Set scroll offset: x lines will be visible above and below the cursor
set scrolloff=7

" Add a bit extra margin to the left
set foldcolumn=1

"""" USABILITY OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in line.
set whichwrap=b,s,h,l,<,>,[,]

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on
set autoindent

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" For regular expressions turn magic on
set magic

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors i.e. Vim will neither flash nor beep.
set noerrorbells
set novisualbell
" And reset the terminal code for the visual bell.
set t_vb=
set tm=500

" Enable use of the mouse for all modes
set mouse=a

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Modelines have historically been a source of security vulnerabilities.
" Disable them and use secure script:
" http://www.vim.org/scripts/script.php?script_id=1876
set nomodeline

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
set wildignore+=.git\*,.hg\*,.svn\*
endif

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

" Fast saving
nmap <leader>w :w!<cr>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"""" MISCELLANEOUS OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
