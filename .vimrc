inoremap jk <esc>
nnoremap H ^
nnoremap L $
nnoremap ,sv :source $MYVIMRC<cr>
nnoremap ,hs :help statusline<cr><c-w>o
inoremap ,% set statusline+=

set laststatus=2
set statusline=%m                              "Modifiable or not
set statusline+=\ %F                           "Full path to file
set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \    "Whitespace
set statusline+=%p                             "How far the cursor is down the file in %
set statusline+=%%                             "`backslashed` percent sign
set statusline+=\ \t\o\t\a\l\ \l\i\n\e\s\ %L   "Total lines in the file

autocmd FileType text set statusline+=%N       "If the filetype is *.txt, include page number
