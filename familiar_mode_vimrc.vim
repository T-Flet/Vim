"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       1.2 - 17-18/01/2014
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

" ALL: Ctrl-Tab,-Shift-Tab : next and previous tab
noremap <C-Tab>   :tabnext<Enter>
noremap <C-S-Tab> :tabprevious<Enter>

" ALL: Ctrl-t,w : New tab and close tab
noremap <C-t> :tabnew<Enter>
noremap <C-w> :tabclose<Enter>

" ALL: Ctrl-x,c,v : cut, copy and paste
noremap <C-x> "*d
noremap <C-c> "*y
noremap <C-v> "*gp

inoremap <C-v> <Esc>"*gpi

" For Ctrl-v to work on Unix, autoselect must be off.
if !has("unix")
  set guioptions-=a
endif

" NORMAL, VISUAL AND INSERT: Crtl-z,y : undo and redo
nnoremap <C-z> u
nnoremap <C-y> <C-r>
vnoremap <C-z> <Esc>u
vnoremap <C-y> <Esc><C-r>
inoremap <C-z> <Esc>ui
inoremap <C-y> <Esc><C-r>i

" NORMAL AND INSERT: Crtl-a : select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" NORMAL, VISUAL AND INSERT: Ctrl-s : save
nnoremap <C-s> :w<Enter>
vnoremap <C-s> <Esc>:w<Enter>
inoremap <C-s> <Esc>:w<Enter>

" NORMAL, VISUAL AND INSERT: Crtl-f : find
nnoremap <C-f> /
inoremap <C-f> <Esc>/
vnoremap <C-f> <Esc>/

" NORMAL, VISUAL: Make arrows behave as arrows (reverting previous maps)
noremap <Left>  <Left>
noremap <Right> <Right>
noremap <Up>    <Up>
noremap <Down>  <Down>

" NORMAL, VISUAL AND INSERT: Shift-Arrows : visual selection
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

" NORMAL, VISUAL AND INSERT: Alt-Shift-Arrows : blockwise-visual selection
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

