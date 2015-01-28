"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.8 - 27-28/01/2014
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

" Set to auto read when a file is changed from the outside
set autoread

" Set "," as map leader, allowing extra key combinations
let mapleader = ","
let g:mapleader = ","

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Dos as the standard file type and handle Unix's and Mac's
set fileformats=dos,unix,mac

" Set what information should be stored in the viminfo file
"           +--Remember buffer list
"           | +--Disable hlsearch while loading viminfo
"           | | +--Remember marks for last 500 files
"           | | |    +--Remember up to 10000 lines in each register
"           | | |    |      +--Remember up to 1MB in each register
"           | | |    |      |     +--Remember last 1000 search patterns
"           | | |    |      |     |     +---Remember last 1000 commands
"           | | |    |      |     |     |
"           v v v    v      v     v     v
set viminfo=%,h,'500,<10000,s1000,/1000,:1000

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

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

" Show file title in window title
set title

" Make abandoned buffers hidden, and generate a single undo history for all
set hidden

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
" Show partial commands in the last line of the screen
set showcmd

 "Adjust completions to match case
set infercase
" Enable command-line completions visualisation menu
set wildmenu
" Show list of completions and complete as much as then iterate full completions
set wildmode=list:longest,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Display line numbers on the left
set number
" Always display the status line, even if only one window is displayed
set laststatus=2
" Format the status line
let &statusline=" Buf:%n   %{HasPaste()}%f%m%r%h %w  CWD: %.40{getcwd()}   %y  Line: %l/%L Col: %c"

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
    set guioptions-=m   "No menubar
    set guioptions-=e   "Allow non-GUI tab pages lines
    set t_Co=256        "Enable 256 colours
    set guitablabel=%M\ %t  "Set label of GUI tab pages lines (requires e above)
endif

" Remove startup screen message
set shortmess+=I

" Maximise on Startup (for Windows). Can also be done through shortcut options
"au GUIEnter * simalt ~x

""" MAPPINGS """

" Restore Menu bar (use _vimrc reload to remove it: <leader>r)
nmap <leader>m :set guioptions+=m<Enter>

" Toggle cursor row highlighting on request...
" highlight CursorLine   term=bold ctermfg=black ctermbg=cyan  cterm=bold
highlight CursorLine   term=bold cterm=inverse
map <silent> <leader>R :set cursorline!<Enter>



"""" 3 - TEXT, FONT AND COLOURS """"""""""""""""""""""""""""""""""""""""""""""""

"Font size
set guifont=Lucida_Sans_Typewriter:h18:cANSI

" Enable syntax highlighting
syntax on

" Set colourscheme
try
colorscheme slate
catch
endtry

set background=dark


""" MAPPINGS """

" ALL: Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<Enter>

" ALL: Shortcuts using <leader>
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

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Modelines have historically been a source of security vulnerabilities.
" Disable them and use secure script:
" http://www.vim.org/scripts/script.php?script_id=1876
set nomodeline

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

" Make selection of areas with no text possible in visual block mode
set virtualedit=block

" Add angle brackets to matching pairs (like all parentheses)
set matchpairs+=<:>

" Work out what the comment character is, by filetype...
autocmd FileType             *sh,awk,python,perl,perl6,ruby    let b:cmt = exists('b:cmt') ? b:cmt : '#'
autocmd FileType             vim                               let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd FileType             haskell                           let b:cmt = exists('b:cmt') ? b:cmt : '--'
autocmd BufNewFile,BufRead   *.vim,.vimrc                      let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd BufNewFile,BufRead   *                                 let b:cmt = exists('b:cmt') ? b:cmt : '#'
autocmd BufNewFile,BufRead   *.p[lm],.t                        let b:cmt = exists('b:cmt') ? b:cmt : '#'

" NORMAL OR VISUAL: Toggle (respectively), line and selection lines commenting
nmap <silent> <leader>k :call ToggleComment()<CR>
vmap <silent> <leader>k :call ToggleBlock()<CR>

" Change initial directory. Can also be done through shortcut options
"cd FOLDER


""" MAPPINGS """

" INSERT: Abbreviations for short and long dates
iab xdate <c-r>=strftime("%d/%m/%y")<cr>
iab xldate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" ALL: Map Y to act like D and C, i.e. to yank until EOL,
" rather than act as yy, which is the default
map Y y$

" ALL: Disable highlight when <leader><Enter> is pressed
map <silent> <leader><Enter> :noh<Enter>

" ALL: Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ALL: Toggle paste mode on and off (mode which does not reformat pastes)
map <leader>pp :setlocal paste!<Enter>

" ALL: Quick paste from OS clipboard
map <leader>v "*p

" NORMAL: Fast save
nmap <leader>w :w!<Enter>

" VISUAL: Make Backspace delete selection and go in insert mode
vnoremap <BS> di

" VISUAL: Select all shortcut
noremap <leader>a VGo1G

" INSERT: Automatically match parenthesis, square brackets and braces
inoremap  (  ()<Left>
inoremap  [  []<Left>
inoremap  {  {}<Left>

" VISUAL: Same as above but around selection
vnoremap  (  s()<Esc>P<Right>%
vnoremap  [  s[]<Esc>P<Right>%
vnoremap  {  s{}<Esc>P<Right>%

" VISUAL: Same as above but with additional spaces
vnoremap  )  s(  )<Esc><Left>P<Right><Right>%
vnoremap  ]  s[  ]<Esc><Left>P<Right><Right>%
vnoremap  }  s{  }<Esc><Left>P<Right><Right>%

" NORMAL: Automatically match quotes
inoremap  '  ''<Left>
inoremap  "  ""<Left>
inoremap  `  ``<Left>

" VISUAL: Automatically match quotes around selection
vnoremap  '  s''<Esc>P<Right>
vnoremap  "  s""<Esc>P<Right>
vnoremap  `  s``<Esc>P<Right>



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

" Deactivate search highlighting on startup
set viminfo^=h


""" MAPPINGS """

" ALL: Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
noremap <c-space> ?

" NORMAL: Extend previous search query
nnoremap //   /<C-R>/
" Same, but put an or ("|") after it
nnoremap ///  /<C-R>/\<BAR>

" NORMAL: Map Backspace to turn off search highlighting until next search
nnoremap <silent> <BS> :nohl<Enter><BS>

" NORMAL: Hilight matches when jumping to next
nnoremap <silent> n   n:call HLNext(0.4)<Enter>
nnoremap <silent> N   N:call HLNext(0.4)<Enter>

" NORMAL AND VISUAL: Shortcut for :s///g
nmap <leader>sg  :%s//g<Left><Left>
vmap <leader>sg  :B s//g<Left><Left>

" Highlight all occurrences of the current word without selecting the next one
nnoremap <leader>h :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nmap <2-LeftMouse> <leader>h

" NORMAL: Make * respect smartcase and also set @/ (to enable 'n' and 'N')
nmap *  :let @/ = '\<'.expand('<cword>').'\>' ==? @/ ? @/ : '\<'.expand('<cword>').'\>'<CR>n

" VISUAL: * and # search for the current selection forwards and backwards
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
set shiftround     " Always indent/unindent to nearest tabstop
set smarttab       " Behave normally with tabs and backspaces at line beginnings
set shiftwidth=4   " Use indents of 4 spaces
set tabstop=4      " An indentation every four columns
set softtabstop=4  " Let backspace delete indent

" Linebreak on 120 characters for nicer visualisation
set linebreak
set tw=120
" or linebreak/wrap at end of window width
set wrap


""" MAPPINGS """

" Indent/unindent current block
nmap %% $>i}``
nmap $$ $<i}``

" NORMAL, VISUAL: Indent/Unindent a line of text using ALT+[hl]
nmap <M-h> <<Left>
nmap <M-l> ><Right>
vmap <M-h> <<
vmap <M-l> >

" NORMAL, VISUAL: Make Left/Right arrows indent/unindent lines as well
nmap <Left>  <M-h>
nmap <Right> <M-l>
vmap <Left>  <M-h>
vmap <Right> <M-l>

" Make the previous map group work for the Command key on Mac
if has("mac") || has("macunix")
    nmap <D-h> <M-h>
    nmap <D-l> <M-l>
    vmap <D-h> <M-h>
vmap <D-l> <M-l>
endif



"""" 7 - MOTIONS AND MOVING AROUND """""""""""""""""""""""""""""""""""""""""""""

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in line.
set whichwrap=b,s,h,l,<,>,[,]

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start


""" MAPPINGS """

" ALL: Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" NORMAL, VISUAL: Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<Enter>`z
nmap <M-k> mz:m-2<Enter>`z
vmap <M-j> :m'>+<Enter>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<Enter>`>my`<mzgv`yo`z

" NORMAL, VISUAL: Make Up/Down arrows move a line of text as well
nmap <Down> <M-j>
nmap <Up>   <M-k>
vmap <Down> <M-j>
vmap <Up>   <M-k>

" Make the previous map group work for the Command key on Mac
if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif



"""" 8 - BUFFERS AND TABS """"""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,split,newtab
    " Make tabline always visible
    set stal=2
catch
endtry

" Make session saves save only tabs and help pages (not extra maps and options)
set sessionoptions=tabpages,help
" Restore last session on startup if Vim is invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"
autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"


""" MAPPINGS """

" ALL: Show all buffers (with shortcuts) and wait for a shortcut for one
nnoremap <leader>bg :buffers<Enter>:buffer<Space>

" ALL: Close the current buffer
command! Bclose call <SID>BufcloseCloseIt()
map <leader>bc :Bclose<Enter>

" ALL: Close all the buffers
map <leader>ba :1,1000 bd!<Enter>

" ALL: Useful mappings for managing tabs (use C-PageUp/Down for :tabp/n)
" Open new tab through file search
map <leader>tf :tabfind <Space>
map <leader>tn :tabnew<Enter>
map <leader>to :tabonly<Enter>
map <leader>tc :tabclose<Enter>
" Move tab to X position (starting from 0)
map <leader>tm :tabmove<Space>
map <leader>t<leader> :tabnext
" Open a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<Enter>/

" ALL: Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<Enter>:pwd<Enter>

" NORMAL: Let 'tl' toggle between this and the last accessed tab
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

" NORMAL: Reload _vimrc file ($real_vimrc set in the real _vimrc)
nmap <leader>r :source $real_vimrc

" NORMAL: Edit real _vimrc file
nmap <leader>real :e $real_vimrc
nmap <leader>repo :e $basic_vimrc



"""" 0 - HELPER FUNCTIONS """"""""""""""""""""""""""""""""""""""""""""""""""""""

" Work out whether the line has a comment then reverse that condition
function! ToggleComment ()
    " Determine the comment character(s)
    let comment_char = exists('b:cmt') ? b:cmt : '#'

    " Grab the line and work out whether it's commented
    let currline = getline(".")

    " If so, remove it and rewrite the line
    if currline =~ '^' . comment_char
        let repline = substitute(currline, '^' . comment_char, "", "")
        call setline(".", repline)

    " Otherwise, insert it
    else
        let repline = substitute(currline, '^', comment_char, "")
        call setline(".", repline)
    endif
endfunction

" Toggle comments down an entire visual selection of lines
function! ToggleBlock () range
    " Determine the comment character(s)
    let comment_char = exists('b:cmt') ? b:cmt : '#'

    " Start at the first line
    let linenum = a:firstline

    " Get all the lines, and decide their comment state by examining the first
    let currline = getline(a:firstline, a:lastline)
    if currline[0] =~ '^' . comment_char
        " If the first line is commented, decomment all
        for line in currline
            let repline = substitute(line, '^' . comment_char, "", "")
            call setline(linenum, repline)
            let linenum += 1
        endfor
    else
        " Otherwise, encomment all
        for line in currline
            let repline = substitute(line, '^\('. comment_char . '\)\?', comment_char, "")
            call setline(linenum, repline)
            let linenum += 1
        endfor
    endif
endfunction


" Draw a ring around the next match
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


" Don't close the window when deleting a buffer
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
