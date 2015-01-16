"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.1 - 15-16/01/2014
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
noremap <C-Tab>   :tabnext<Enter>
noremap <C-S-Tab> :tabprevious<Enter>

" ALL MODES: Ctrl-t,w : New tab and close tab
noremap <C-t> :tabnew<Enter>
noremap <C-w> :tabclose<Enter>

" NORMAL AND INSERT MODES: Ctrl-x,c,v : cut, copy and paste
nnoremap <C-x> d
nnoremap <C-c> y
nnoremap <C-v> "+gP

inoremap <C-v> <Esc>"+gPi

" For Ctrl-v to work on Unix, autoselect must be off.
if !has("unix")
  set guioptions-=a
endif

" NORMAL AND INSERT MODES: Crtl-z,y : undo and redo
nnoremap <C-z> u
nnoremap <C-y> <C-r>

inoremap <C-z> <Esc>ui
inoremap <C-y> <Esc><C-r>i

" NORMAL AND INSERT MODES: Crtl-a : select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" NORMAL, VISUAL AND INSERT MODES: Ctrl-s : save
nnoremap <C-s> :w<Enter>
vnoremap <C-s> <Esc>:w<Enter>
inoremap <C-s> <Esc>:w<Enter>

" NORMAL, VISUAL AND INSERT MODES: Crtl-f : find
nnoremap <C-f> /
inoremap <C-f> <Esc>/
vnoremap <C-f> <Esc>/

" ALL MODES: Ctrl-F4 closes the window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" NORMAL, VISUAL AND INSERT MODES: Shift-Arrows : visual selection
nnoremap <S-Right> v<Right>
nnoremap <S-Left>  v<Left>
nnoremap <S-Up>    v<Up>
nnoremap <S-Down>  v<Down>

vnoremap <S-Right> <Right>
vnoremap <S-Left>  <Left>
vnoremap <S-Up>    <Up>
vnoremap <S-Down>  <Down>

inoremap <S-Up>    <Esc>v<Up>
inoremap <S-Down>  <Esc>v<Down>
inoremap <S-Left>  <Esc>v<Left>
inoremap <S-Right> <Esc>v<Right>

" NORMAL, VISUAL AND INSERT MODES: Alt-Shift-Arrows : blockwise-visual selection
noremap <A-S-Right> <C-v><Right>
noremap <A-S-Left>  <C-v><Left>
noremap <A-S-Up>    <C-v><Up>
noremap <A-S-Down>  <C-v><Down>

vnoremap <A-S-Right> <Right>
vnoremap <A-S-Left>  <Left>
vnoremap <A-S-Up>    <Up>
vnoremap <A-S-Down>  <Down>

inoremap <A-S-Up>    <Esc><C-v><Right>
inoremap <A-S-Down>  <Esc><C-v><Left>
inoremap <A-S-Left>  <Esc><C-v><Up>
inoremap <A-S-Right> <Esc><C-v><Down>

" VISUAL MODE: Backspace deletes selection
vnoremap <BS> d

