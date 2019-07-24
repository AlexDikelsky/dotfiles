call plug#begin('~/.vim/plugged')

"Latex plugin
Plug 'lervag/vimtex'

call plug#end()

autocmd Filetype tex setlocal tabstop=2 
"Decreases tab space for latex


" Adds relative line numbers
:set number relativenumber
:highlight LineNr ctermfg=grey
