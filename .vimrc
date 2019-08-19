" lets `leader` stand for `,`. useful for not breaking things
let mapleader = ","

let localmapleader = "\\"

" echo ">^.^<"
" usage of echo. echom puts what;s in the quotes into :messages

" :set number       turns nums on
" :set number?      returns `number`
" :set number!      toggles `number`
" :set number?      returns `number`
" :set nonumber     turns `number off
" :set number?      returns `number`

" :set numberwidth=10    Moves numbers to the right
" :set numberwidth?      returns `numberwidth=10`

"Dont use this one. Inserts quotes around something that is visually selected
"vnoremap <leader>aq <esc><esc>`<i"<esc>`>lli"<esc>

" the one without escape doesnt work because it just does whatever happens when `dd` is inserted " You need to do <esc> first
"imap <c-d> dd
"imap <c-d> <esc>ddi

set relativenumber number

augroup fast_search
	nnoremap <leader>s :%s/
augroup END

"Uppercases current word in different modes
augroup uppercase
	inoremap <leader><c-u> <esc>viwUi
	nnoremap <leader><c-u> viwU
augroup END

"Makes it easy to add more to this file
augroup edit_vimrc
	noremap <leader>ev :vsplit $MYVIMRC<cr>
	noremap <leader>sv :source $MYVIMRC<cr>
augroup END

"Stronger directions
augroup directions
	noremap H ^
	noremap L $
augroup END

"Insert line above
augroup insert_line
	nnoremap <leader>O O<esc>j
	nnoremap <leader>o o<esc>k
augroup END

" Sets spell automaticly for *.txt files
augroup spelling
	nnoremap <leader>ts :set spell!<cr>
augroup END

augroup commenting
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
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

augroup unicode
	"Easier m-dash
	inoremap --- <c-v>u2014
augroup END

"onoremap in( :<c-u>normal! f(vi(<cr>

augroup markdown 
	"Adds `around header` and `in header` for .md files
	autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^[-=][-=]\\+$\r:nohlsearch\rg_vk0"<cr>
	autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^[-=][-=]\\+$\r:nohlsearch\rkvg_"<cr>
augroup END

augroup email
	onoremap in@ :<c-u>execute "normal! f@lvt."<cr>
augroup end
set laststatus=2
