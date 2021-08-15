let mapleader = ","
let localmapleader = "\\"

set hlsearch
set incsearch
set dictionary=/usr/share/dict/american-english
syntax on

filetype plugin indent on
filetype plugin on

set history=1000
set nrformats-=octal
set scrolloff=1
set backspace=indent,eol,start
set autoindent

set showcmd

packadd idris2-vim
nnoremap <leader>set :w<cr>:!pdflatex %<cr>:!xdg-open *.pdf<cr>

set shiftwidth=4
set softtabstop=4
set noexpandtab
nnoremap / /\V\c
nnoremap ? ?\V\c
nnoremap <c-l> :nohlsearch<cr>
noremap <leader>ev :vsplit $MYVIMRC<cr>:setlocal foldmethod=marker<cr>
noremap <leader>sv :source $MYVIMRC<cr>

noremap Y y$
noremap H ^
noremap L $
nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k
nnoremap ; :
nnoremap : <nop>
inoremap jk <esc>
inoremap jl <c-o>A
inoremap ji <c-o>I
inoremap jz <c-o>zz
inoremap <c-e> <esc>A
inoremap  <esc>
inoremap js <esc>mz[sz=1<cr>`za

set laststatus=2
set statusline=%m                              "Modifiable or not
set statusline+=\ %f                           "relative pat
set statusline+=\ (%c,  "Column number
set statusline+=\ %l)   " line number
set statusline+=\ \l\i\n\e\s\:\ %L   "Total lines in the file

"Superscript and subscript letters
"Credit to https://bitbucket.org/atimholt/dot_files/src/default/vimrc 
"for the superscript chars
"
" source $HOME/.vim/pack/AlexDikelsky/start/special_chars.vim
