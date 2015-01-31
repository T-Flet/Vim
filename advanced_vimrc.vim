"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       0.2 - 30-31/01/2014
"
"   Repository:
"       https://github.com/Dr-Lord/Vim
"
"   Description:
"       Advanced non-extension related part of the personal vim configuration
"       of Dr-Lord. Started from general tips and tricks gathered from use,
"       research and study of the best vimrcs found through it, and (hopefully)
"       ending in a complete configuration with asimptotically slowing evolution
"       over time.
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


"""" 2 - USER INTERFACE """"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""" 3 - TEXT, FONT AND COLOURS """"""""""""""""""""""""""""""""""""""""""""""""

" Make the 81st column of long lines stand out
highlight ColorColumn guibg=DarkGreen
call matchadd('ColorColumn', '\%81v', 100)



"""" 4 - USABILITY """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save
autocmd BufWrite * :call DeleteTrailingWS()

" Work out what the comment character is, by filetype...
autocmd FileType             *sh,awk,python,perl,perl6,ruby    let b:cmt = exists('b:cmt') ? b:cmt : '#'
autocmd FileType             vim                               let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd FileType             haskell                           let b:cmt = exists('b:cmt') ? b:cmt : '--'
autocmd BufNewFile,BufRead   *.vim,.vimrc                      let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd BufNewFile,BufRead   *                                 let b:cmt = exists('b:cmt') ? b:cmt : '#'
autocmd BufNewFile,BufRead   *.p[lm],.t                        let b:cmt = exists('b:cmt') ? b:cmt : '#'


""" MAPPINGS """

" NORMAL OR VISUAL: Toggle (respectively), line and selection lines commenting
nmap <silent> <leader>k :call ToggleComment()<CR>
vmap <silent> <leader>k :call ToggleBlock()<CR>



"""" 5 - SEARCH """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" MAPPINGS """

" NORMAL: Hilight matches when jumping to next
nnoremap <silent> n   n:call HLNext(0.4)<CR>
nnoremap <silent> N   N:call HLNext(0.4)<CR>

" Search and replace the selected text
vnoremap <leader>sg :call VisualSelection('replace', '')<CR>

" VISUAL: * and # search for the current selection forwards and backwards
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>



"""" 6 - INDENTATION """""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""" 7 - MOTIONS AND MOVING AROUND """""""""""""""""""""""""""""""""""""""""""""


"""" 8 - BUFFERS AND TABS """"""""""""""""""""""""""""""""""""""""""""""""""""""


"""" 9 - OTHER OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""" 0 - HELPER FUNCTIONS """"""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing White Space
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc


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
    highlight RedOnRed guifg=Black guibg=DarkOrange
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


function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    "" The next two lines would require the Ack.vim extension
    ""elseif a:direction == 'gv'
        ""call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '//g<Left><Left>')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction
