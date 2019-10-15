let mapleader = ","
let localmapleader = "\\"

set relativenumber number
highlight LineNr ctermfg=grey

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
execute pathogen#infect()

call plug#begin()
	"Vimtex
	Plug 'lervag/vimtex'   "great syntax highliting
	Plug 'tommcdo/vim-lion'  "better indentation stuff
call plug#end()
" }}}
"Running Programs {{{
augroup running_programs
	nnoremap <leader>chm :!chmod 755 %<cr>
	nnoremap <leader>ex :w<cr>:!./%<cr>
	nnoremap <leader>so :w<cr>:source %<cr>
	nnoremap <leader>tex :w<cr>:!latex %<cr>
	nnoremap \set :w<cr>:!pslatex<cr>

augroup END
"}}}
"Tabs {{{
augroup Tabs
    set shiftwidth=4
    set softtabstop=4
    set noexpandtab
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
augroup stuff
   inoreab proba probability
   inoreab possi possibility
   inoreab posss possibilities
   inoreab sams sample space
   inoreab diffe different
   "Latex
   inoreab begit \begin{itemize}<cr>\end{itemize}<esc>O\item[]
augroup END
"augroup rust_stuff
"	autocmd FileType rust nnoremap <buffer> <localleader>c I//<esc>
"	autocmd FileType rust inoremap <buffer> iff if<space>{<left>
"	autocmd FileType rust inoremap <buffer> if<space> TRY_AGAIN_WITH_iff
"augroup END
"}}}
"Remove some keystrokes {{{
augroup important
	nnoremap ; :
	nnoremap : <nop>
	inoremap jk <esc>
	inoremap <esc> <nop>
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
