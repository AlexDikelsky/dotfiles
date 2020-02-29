let mapleader = ","
let localmapleader = "\\"

"No line numbers because screen is small

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

set showcmd        "Shows the stuff you're typing in the bottom right

set foldmethod=marker

"Stuff I always forget {{{
"   :help group
"	for list of things to name stuff to get syntax highlighting to work
"   :set list
"	to change tabs to ^I s
"}}}

" Shebangs {{{
augroup shebangs
    inoreabbrev py #!/usr/bin/env python3
    inoreabbrev po #!/usr/bin/potion
    inoreabbrev ba #!/bin/bash
    inoreabbrev psvm public static void main(String[] args) {
augroup END
" }}}
"Plugins: {{{
    packadd vim-lion
    packadd clever-f.vim
    packadd bccalc.vim
" }}}
"Running Programs {{{
augroup running_programs
	nnoremap <leader>chm :!chmod 755 %<cr>
	nnoremap <leader>ex :w<cr>:!./%<cr>
	nnoremap <leader>so :w<cr>:source %<cr>
	nnoremap <leader>set :w<cr>:!pdflatex %<cr>:!zathura *.pdf<cr>
	"P because plaintex
	nnoremap <leader>pset :w<cr>:!pdftex %<cr>:!zathura *.pdf<cr>

	"R Script
	nnoremap <leader>rs :w<cr>:!R --slave < %<cr>
	nnoremap <leader>def "zyaW:!sdcv <c-r>z<cr>

	"Execute line as bc
	"The <del> at the end removes the new line.
	"nnoremap <leader>bc :!echo 'scale=10;<c-r>"<del>' \| bc

augroup END
"}}}
"Tab Size {{{
augroup Tabs
    set shiftwidth=4
    set softtabstop=4
    set noexpandtab
    autocmd FileType awk set tabstop=8
    autocmd FileType awk set shiftwidth=8
    "autocmd FileType haskell set tabstop=4
augroup END
" }}}
"Searching for strings {{{
augroup searching
	"Starts searches automaticly with the Very Nomagic option
	nnoremap / /\V\c
	nnoremap ? ?\V\c
augroup END

"Highlights training whitespace
augroup highlighting
	"Unhighlight everything
	nnoremap <c-l> :nohlsearch<cr>
augroup END
"}}}
"Editing vimrc from anywhere {{{
augroup edit_vimrc
	noremap <leader>ev :vsplit $MYVIMRC<cr>:setlocal foldmethod=marker<cr>
	noremap <leader>sv :source $MYVIMRC<cr>
	"Uncomment and use this command when deciding what you want to keep in your .vimrc
	"nnoremap <leader>in :!echo "<c-r>"" >> .newvimrc
augroup END
"}}}
"Simple motions {{{
augroup directions
    noremap Y y$

    "I use these more often than screen location commands
    noremap H ^
    noremap L $

    "remap these so they are still usable
    noremap ,h H
    noremap ,l L
    noremap ,m M
augroup END
"}}}
"Simple insertions {{{
"Insert line above
augroup insert_line
	nnoremap [<space> O<esc>j
	nnoremap ]<space> o<esc>k
augroup END
"}}}
"Autocompletion {{{
augroup abbreviations
    "General
   inoreab jalph abcdefghijklmnopqrstuvwxyz
   inoreab siz six
    "Math
   inoreab proba probability
   inoreab possi possibility
   inoreab posss possibilities
   inoreab sams sample space
   inoreab diffe different
    "Chem
   inoreab equili equilibrium
    "Myth
   inoreab ica Icarus
   inoreab daed Daedalus

   "Geology
   inoreab sedi sediment
   inoreab sedy sedimentary
   inoreab Sedi Sediment
   inoreab ign  igneous

   "Latex
   inoreab latst \documentclass{article}<cr>\begin{document}<cr>\end{document}<esc><up>o
   inoreab begit \begin{itemize}<cr>\end{itemize}<esc>O\item[]

   "For spreadsheet
   "inoreab 0 vim
   "inoreab 1 neovim
   "inoreab 2 emacs

   "These are a smidge hackey because its hard to actually write <c-a> without
   "it getting interprated
   "inoreab ca < c-a ><esc>hxhhhhxA 
   "inoreab cb < c-b ><esc>hxhhhhxA

augroup END
"}}}
"Large keymap changes {{{
augroup important
	nnoremap ; :
	nnoremap : <nop>
	inoremap jk <esc>
	inoremap jl <c-o>A
	inoremap ji <c-o>I
	inoremap jz <c-o>zz
	inoremap <c-e> <esc>A
	"inoremap <esc> <nop>
	inoremap  <esc>
	inoremap js <esc>mz[sz=1<cr>`za
augroup END
"}}}
"Prepare a file for posting {{{
augroup prep
	nnoremap <leader>pfr :%s/\v^/    /g<cr>
augroup END
"}}}
"Statusline stuff {{{
set laststatus=2
set statusline=%m                              "Modifiable or not
set statusline+=\ %f                           "relative pat
set statusline+=\ (%c,  "Column number
set statusline+=\ %l)   " line number
set statusline+=\ \l\i\n\e\s\:\ %L   "Total lines in the file
"}}}
"Stop making tmux mistakes {{{
augroup tmux_stuff
    nnoremap <c-w>o <c-w>w
    nnoremap <c-w>O <c-w>o
augroup END
"}}}
"Macros {{{
augroup Macros    

"mz                      "create a mark here
"?\(\d\+\.\)\+\d\+<cr>   "Search for stuff like 4.3, 1.2.3.4, ..., but not stuff without a decimal like 3
""zyiW			"Yank that WORD
"'z                      "Go back to previous mark
""zp		        "Paste the word from earlier
"a.1			"Append .1 to the end
"<c-a>			"inc the value

    inoreab ss <esc>mz?\(\d\+\.\)\+\d\+<cr>"zyiW'z"zpa.1

    "This doesn't work as intended, need to look at delimiters soon
    inoreab sn <esc>mz?\(\d\+\.\)\+\d\+<cr>"zyiW'z"zp<c-a>a
augroup END
"}}}
"Special Characters {{{
"Superscript and subscript letters
"Credit to https://bitbucket.org/atimholt/dot_files/src/default/vimrc 
"for the superscript chars
"
source /home/alex/.vim/pack/AlexDikelsky/start/special_chars.vim
"}}}
