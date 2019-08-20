let mapleader = ","
let localmapleader = "\\"
set relativenumber number
augroup edit_vimrc
	noremap <leader>ev :vsplit $MYVIMRC<cr>
	noremap <leader>sv :source $MYVIMRC<cr>
augroup END
augroup directions
	noremap H ^
	noremap L $
augroup END
"Insert line above
augroup insert_line
	nnoremap [<space> O<esc>j
	nnoremap ]<space> o<esc>k
augroup END
augroup rust_stuff
	autocmd FileType rust nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType rust inoremap <buffer> iff if<space>{<left>
	autocmd FileType rust inoremap <buffer> if<space> TRY_AGAIN_WITH_iff
augroup END
"Easier way to <esc>
augroup escapeing
	inoremap jk <esc>
	inoremap <esc> <nop>
augroup END
