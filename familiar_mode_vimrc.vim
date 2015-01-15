"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"       Alternative, more familiar mappings vim configuration file.
"       It overwrites corresponding previous maps and makes vim behave like a
"       typical modern text editor for common maps (most of the time, then the
"       Vimness kicks in).
"

"""" MAPPINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ALL MODES: Ctrl-Tab,-Shift-Tab : next and previous tab
map <C-Tab>   :tabnext<Enter>
map <C-S-Tab> :tabprevious<Enter>

" ALL MODES: Ctrl-t,w : New tab and close tab
map <C-t> :tabnew<Enter>
map <C-w> :tabclose<Enter>

" NORMAL AND INSERT MODES: Ctrl-x,c,v : cut, copy and paste
nmap <C-x> d
nmap <C-c> y
nmap <C-v> "+gP

imap <C-v> <Esc>"+gPi

" For Ctrl-v to work on Unix, autoselect must be off.
if !has("unix")
  set guioptions-=a
endif

" NORMAL AND INSERT MODES: Crtl-z,y : undo and redo
nmap <C-z> u
nmap <C-y> <C-r>

imap <C-z> <Esc>ui
imap <C-y> <Esc><C-r>i

" NORMAL AND INSERT MODES: Crtl-a : select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" NORMAL, VISUAL AND INSERT MODES: Ctrl-s : save
nmap <C-s> :w<Enter>
vmap <C-s> <Esc>:w<Enter>
imap <C-s> <Esc>:w<Enter>

" NORMAL, VISUAL AND INSERT MODES: Crtl-f : find
nmap <C-f> /
imap <C-f> <Esc>/
vmap <C-f> <Esc>/

" NORMAL, VISUAL AND INSERT MODES: Shift-Arrows : visual selection
nmap <S-Right> v<Right>
nmap <S-Left>  v<Left>
nmap <S-Up>    v<Up>
nmap <S-Down>  v<Down>

vmap <S-Right> <Right>
vmap <S-Left>  <Left>
vmap <S-Up>    <Up>
vmap <S-Down>  <Down>

imap <S-Up>    <Esc>v<Up>
imap <S-Down>  <Esc>v<Down>
imap <S-Left>  <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" VISUAL MODE: Backspace deletes selection
vnoremap <BS> d

" Use Ctrl-q to enter blockwise-visual mode
noremap <C-Q>		<C-V>

" ALL MODES: Ctrl-F4 closes the window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c
