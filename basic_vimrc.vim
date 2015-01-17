"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.1 - 16-17/01/2014
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Non-extension related part of the personal vim configuration of Dr-Lord.
"       Started from general tips and tricks gathered from use, research and
"       study of the best vimrcs found through it, and (hopefully) ending in a
"       complete configuration with asimptotically slowing evolution over time.
"
"   Sections:
"       1 - Basics
"       2 - User Interface
"       3 - Text, Font and Colours
"       4 - Usability
"       5 - Search
"       6 - Indentation
"       7 - Motions and Moving Around
"       8 - Buffers and Tabs
"       9 - Other Options
"       0 - Helper Functions



"""" 1 - BASICS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ward off unexpected things and sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine file type from name and possibly contents, which
" allows intelligent auto-indenting and filetype specific plugins.
filetype indent plugin on

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Set "," as map leader, allowing extra key combinations
let mapleader = ","
let g:mapleader = ","

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Dos as the standard file type
set ffs=dos,unix,mac


" Use persistent undo
if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=$HOME/tmp/.VIM_UNDO_FILES

    " Save a lot of back-history...
    set undolevels=5000

    " Actually switch on persistent undo
    set undofile
endif



"""" 2 - USER INTERFACE """"""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" Format the status line
let &statusline=" Buf:%n   %{HasPaste()}%f%m%r%h %w  PWD: %.40{getcwd()}   %y  Line: %l/%L Col: %c"

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Set scroll offset: x lines will be visible above and below the cursor
set scrolloff=7

" Add a bit extra margin to the left
set foldcolumn=1

" Make the 81st column of long lines stand out
highlight ColorColumn ctermbg=green
call matchadd('ColorColumn', '\%81v', 100)

" Set extra options when running in GUI mode: in total: gmrLtaAc
if has("gui_running")
set guioptions+=aA  "Make selection in all modes available to other applications
set guioptions+=c   "Console instead of popups for simple choices
set guioptions-=T   "No Toolbar
"set guioptions-=m   "No menubar
set guioptions-=e   "Allow non-GUI tab pages lines
set t_Co=256        "Enable 256 colours
set guitablabel=%M\ %t  "Set label of GUI tab pages lines (requires e above)
endif

" Maximise on Startup (for Windows). Can also be done through shortcut options
"au GUIEnter * simalt ~x



"""" 3 - TEXT, FONT AND COLOURS """"""""""""""""""""""""""""""""""""""""""""""""

"Font size
:set guifont=Lucida_Sans_Typewriter:h18:cANSI

" Enable syntax highlighting
syntax on

" Set colourscheme
try
colorscheme slate
catch
endtry

set background=dark


""" MAPPINGS """

" ALL MODES: Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<Enter>

" ALL MODES: Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=



"""" 4 - USABILITY """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors i.e. Vim will neither flash nor beep.
set noerrorbells
set novisualbell
" And reset the terminal code for the visual bell.
set t_vb=
set tm=500

" Enable use of the mouse for all modes if possible
if has('mouse')
set mouse=a
endif

" Quickly time out on keycodes, but never time out on MAPPINGS
set notimeout ttimeout ttimeoutlen=200

" Modelines have historically been a source of security vulnerabilities.
" Disable them and use secure script:
" http://www.vim.org/scripts/script.php?script_id=1876
set nomodeline

" Open any file with a pre-existing swapfile in readonly mode
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echomsg ErrorMsg
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 2
augroup END

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
set wildignore+=.git\*,.hg\*,.svn\*
endif

" Turn semi-permanent backups and swapfiles off, but leave backup during writes
set nobackup
set noswapfile
set writebackup

" Delete trailing white space on save
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Change initial directory. Can also be done through shortcut options
"cd FOLDER


""" MAPPINGS """

" ALL MODES: Map Y to act like D and C, i.e. to yank until EOL,
" rather than act as yy, which is the default
map Y y$

" ALL MODES: Disable highlight when <leader><Enter> is pressed
map <silent> <leader><Enter> :noh<Enter>

" ALL MODES: Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ALL MODES: Toggle paste mode on and off (mode which does not reformat pastes)
map <leader>pp :setlocal paste!<Enter>

" ALL MODES: Quick paste from OS clipboard
map <leader>v "+p

" NORMAL MODE: Fast saving
nmap <leader>w :w!<Enter>



"""" 5 - SEARCH """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hilight search results
set hlsearch
" Hilight search results as the search is typed
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" For regular expressions turn magic on
set magic


""" MAPPINGS """

" ALL MODES: Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" NORMAL MODE: Map Backspace to turn off search highlighting until next search
nnoremap <BS> :nohl<Enter><BS>

" NORMAL MODE: Hilight matches when jumping to next
nnoremap <silent> n   n:call HLNext(0.4)<Enter>
nnoremap <silent> N   N:call HLNext(0.4)<Enter>

" NORMAL AND VISUAL MODES: Shortcut for :s///g
nmap S  :%s//g<LEFT><LEFT>
vmap S  :B s//g<LEFT><LEFT>

" VISUAL MODE: * and # searchs for the current selection forwards and backwards
vnoremap <silent> * :call VisualSelection('f', '')<Enter>
vnoremap <silent> # :call VisualSelection('b', '')<Enter>



"""" 6 - INDENTATION """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on
set autoindent

" Automatically indent in nice, obvious places (e.g. after a line ending in { )
set smartindent

" Indentation settings for using 4 spaces instead of tabs.
" Use :retab to convert all tabs in a file under these settings.
set expandtab      " Use spaces instead of tabs
set smarttab       " Behave normally with tabs and backspaces at line beginnings
set shiftwidth=4   " Use indents of 4 spaces
set tabstop=4      " An indentation every four columns
set softtabstop=4  " Let backspace delete indent

" Linebreak on 120 characters for nicer visualisation
set linebreak
set tw=120
" or linebreak/wrap at end of window width
set wrap



"""" 7 - MOTIONS AND MOVING AROUND """""""""""""""""""""""""""""""""""""""""""""

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in line.
set whichwrap=b,s,h,l,<,>,[,]

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start


""" MAPPINGS """

" ALL MODES: Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" NORMAL, VISUAL MODE: Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<Enter>`z
nmap <M-k> mz:m-2<Enter>`z
vmap <M-j> :m'>+<Enter>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<Enter>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>
endif



"""" 8 - BUFFERS AND TABS """"""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Remember info about open buffers on close
set viminfo^=%
" and return to last edit position when opening files
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif


""" MAPPINGS """

" ALL MODES: Show all buffers (with shortcuts) and wait for a shortcut for one
nnoremap <leader>bg :buffers<Enter>:buffer<Space>

" ALL MODES: Close the current buffer
command! Bclose call <SID>BufcloseCloseIt()
map <leader>bc :Bclose<Enter>

" ALL MODES: Close all the buffers
map <leader>ba :1,1000 bd!<Enter>

" ALL MODES: Useful mappings for managing tabs (C-PageUp/Down for :tabp/n)
" Open new tab through file search
map <leader>tf :tabfind <Space>
map <leader>tn :tabnew<Enter>
map <leader>to :tabonly<Enter>
map <leader>tc :tabclose<Enter>
" Move tab to X position (starting from 0)
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" ALL MODES: Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<Enter>/

" ALL MODES: Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<Enter>:pwd<Enter>

" NORMAL MODE: Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<Enter>
au TabLeave * let g:lasttab = tabpagenr()



"""" 9 - OTHER OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


""" MAPPINGS """

" NORMAL MODE: Reload _vimrc file ($real_vimrc set in the real _vimrc)
:nmap <leader>r :source $real_vimrc

" NORMAL MODE: Edit real _vimrc file
:nmap <leader>real :e $real_vimrc
:nmap <leader>repo :e $basic_vimrc



"""" 0 - HELPER FUNCTIONS """"""""""""""""""""""""""""""""""""""""""""""""""""""

function! HLNext (blinktime)
    highlight RedOnRed ctermfg=red ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    echo matchlen
    let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
            \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
            \ . '\|'
            \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
    let ring = matchadd('RedOnRed', ring_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction


function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
        en
        return ''
endfunction


" Don't close window, when deleting a buffer
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
        else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
