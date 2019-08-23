let mapleader = ","
let localmapleader = "\\"
set relativenumber number
highlight LineNr ctermfg=grey
set hlsearch
set incsearch
set history=1000
set nrformats-=octal
set shiftwidth=4

set foldmethod=indent
setlocal foldmethod=marker

" Shebangs {{{
augroup shebangs
    inoreabbrev py #!/usr/bin/env python3
    inoreabbrev po #!/usr/bin/potion
    inoreabbrev ba #!/bin/bash
augroup END
" }}}

"Plugins: {{{
"Delete this after finished
execute pathogen#infect()

call plug#begin()
	"Vimtex
	Plug 'lervag/vimtex'
call plug#end()
" }}}

"Running Programs {{{
augroup running_programs
	nnoremap <leader>chm :!chmod 755 %<cr>
	nnoremap <leader>ex :!./%<cr>
augroup END
"}}}

"Searching for strings {{{
augroup searching
	"Starts searches automaticly with the Very Nomagic option
	nnoremap / /\V
augroup END

"Highlights training whitespace
augroup highlighting
	"Highlights all trailing whitespace
	nnoremap <leader>w :match Error /\v\s+$/<cr>
	"Unhighlights all trailing whitespace
	nnoremap <leader>W :match None /\v\s+$/<cr>
	"Unhighlight everything
	nnoremap <leader>H :nohlsearch<cr>
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
	noremap H ^
	noremap L $
augroup END
"}}}

"Simple insertions {{{
"Insert line above
augroup insert_line
	nnoremap [<space> O<esc>j
	nnoremap ]<space> o<esc>k
augroup END
"}}}

"Autocompletion for rust {{{
augroup rust_stuff
	autocmd FileType rust nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType rust inoremap <buffer> iff if<space>{<left>
	autocmd FileType rust inoremap <buffer> if<space> TRY_AGAIN_WITH_iff
augroup END
"}}}

"Easier way to <esc> {{{
augroup escapeing
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
