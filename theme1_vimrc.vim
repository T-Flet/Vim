"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       0.1 - 11-12/02/2015
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Theme related part of the personal vim configuration of Dr-Lord.
"       This configuration file deals with colours, fonts and any other
"       graphical preference setting.
"
"   Sections:
"       1 - Basics
"



"""" 1 - BASICS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set font and size
set guifont=Lucida_Sans_Typewriter:h14:cANSI

" Set colourscheme
colorscheme torte

" Set row number colour (no row highlighting whatsoever)
highlight CursorLine term=NONE cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNR guifg=Red guibg=NONE


" Set popup (including autocomplete one) colours
highlight Pmenu guibg=DarkGray guifg=Black
highlight PMenuSel guibg=Gray guifg=White


" Set specific column highlighting
highlight ColorColumn guibg=DarkGreen

" Search highlighting colour
highlight Visual guifg=NONE guibg=#333333 gui=NONE
highlight Search guifg=NONE guibg=#444444
