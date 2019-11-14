let mapleader = ","
let localmapleader = "\\"

"No line numbers because screen is small

set hlsearch
set incsearch

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
augroup END
" }}}
"Plugins: {{{

call plug#begin()
	"Decided to remove vimtex
	Plug 'tommcdo/vim-lion'  "better indentation stuff
	Plug 'rhysd/clever-f.vim'  "Search forward with f easier
call plug#end()
" }}}
"Running Programs {{{
augroup running_programs
	nnoremap <leader>chm :!chmod 755 %<cr>
	nnoremap <leader>ex :w<cr>:!./%<cr>
	nnoremap <leader>so :w<cr>:source %<cr>
	nnoremap <leader>set :w<cr>:!pdflatex %<cr>:!zathura *.pdf<cr>
	"P because plaintex
	nnoremap <leader>pset :w<cr>:!pdftex %<cr>:!zathura *.pdf<cr>

	"Execute line as bc
	"The <del> at the end removes the new line.
	nnoremap <leader>bc :!echo 'scale=20;<c-r>"<del>' \| bc

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
    "Remaps J to scroll down by a line and K to scroll up for a line for

    noremap Y y$
    noremap H ^
    noremap L $
augroup END
"}}}
"Simple insertions {{{
"Insert line above
augroup tilde
    autocmd FileType plaintex inoremap <c-@> ~
    "For some reason <c-<space>> doesnt work directly, but you can do <c-@> to
    "make it work anyway
augroup END
augroup insert_line
	nnoremap [<space> O<esc>j
	nnoremap ]<space> o<esc>k
augroup END
"}}}
"Autocompletion {{{
augroup abbreviations
   inoreab proba probability
   inoreab possi possibility
   inoreab posss possibilities
   inoreab sams sample space
   inoreab diffe different
   inoreab siz six
   "Latex
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
"augroup rust_stuff
"	autocmd FileType rust nnoremap <buffer> <localleader>c I//<esc>
"	autocmd FileType rust inoremap <buffer> iff if<space>{<left>
"	autocmd FileType rust inoremap <buffer> if<space> TRY_AGAIN_WITH_iff
"augroup END
"}}}
"Large keymap changes {{{
augroup important
	nnoremap ; :
	nnoremap : <nop>
	inoremap jk <esc>
	inoremap jz <c-o>zz
	inoremap <esc> <nop>
	inoremap  <esc>
augroup END
"}}}
"Prepare a file for posting {{{
augroup prep
	nnoremap <leader>pfr :set nonumber norelativenumber<cr>:%s/\v^/    /g<cr>
augroup END
"}}}
"Statusline stuff {{{
set laststatus=2
set statusline=%m                              "Modifiable or not
set statusline+=\ %F                           "Full path to file
set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \    "Whitespace
set statusline+=%p                             "How far the cursor is down the file in %
set statusline+=%%                             "`backslashed` percent sign
set statusline+=\ \t\o\t\a\l\ \l\i\n\e\s\:\ %L   "Total lines in the file
"}}}
"Stop making tmux mistakes {{{
augroup tmux_stuff
    nnoremap <c-w>o <c-w>w
    nnoremap <c-w>O <c-w>o
augroup END
"}}}
