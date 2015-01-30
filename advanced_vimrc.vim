"""" INTRODUCTION """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Author:
"       Dr-Lord
"   Version:
"       0.1 - 27-28/01/2014
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


"""" 4 - USABILITY """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""" 6 - INDENTATION """""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""" 7 - MOTIONS AND MOVING AROUND """""""""""""""""""""""""""""""""""""""""""""


"""" 8 - BUFFERS AND TABS """"""""""""""""""""""""""""""""""""""""""""""""""""""


"""" 9 - OTHER OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""


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

