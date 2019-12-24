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
    packadd vim-lion
    packadd clever-f.vim
    packadd bccalc.vim

	"Plug 'tommcdo/vim-lion'  "better indentation stuff
	"Plug 'rhysd/clever-f.vim'  "Search forward with f easier
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
	nnoremap <leader>rs :w<cr>:R --slave < %<cr>

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
    "Remaps J to scroll down by a line and K to scroll up for a line for

    noremap Y y$
    noremap H ^
    noremap L $
augroup END
"}}}
"Simple insertions {{{
"Insert line above
augroup tilde
    "autocmd FileType plaintex inoremap <c-@> ~
    "For some reason <c-<space>> doesnt work directly, but you can do <c-@> to
    "make it work anyway
    "Alphabet
    inoremap jalph abcdefghijklmnopqrstuvwxyz
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
   inoreab equili equilibrium
   inoreab siz six
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
"Large keymap changes {{{
augroup important
	nnoremap ; :
	nnoremap : <nop>
	inoremap jk <esc>
	inoremap ja <esc>A
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
"Special Characters {{{
"Superscript and subscript letters
"Credit to https://bitbucket.org/atimholt/dot_files/src/default/vimrc 
"for the superscript chars

:digraph aS 7491
:digraph bS 7495
:digraph cS 7580
:digraph dS 7496
:digraph eS 7497
:digraph fS 7584
:digraph gS 7501
:digraph hS 688
:digraph iS 8305
:digraph jS 690
:digraph kS 7503
:digraph lS 737
:digraph mS 7504
:digraph nS 8319
:digraph oS 7506
:digraph pS 7510
" No superscript “q” in unicode
" :digraph qS
:digraph rS 691
:digraph sS 738
:digraph tS 7511
:digraph uS 7512
:digraph vS 7515
:digraph wS 695
:digraph xS 739
:digraph yS 696
:digraph zS 7611

"Subscripts
:digraph as 8336
"Not found
":digraph bs 
"Not found
":digraph cs 
":digraph ds
:digraph es 8337
":digraph fs 
":digraph gs 
:digraph hs 8341
:digraph is 7522
:digraph js 11388
:digraph ks 8342
:digraph ls 8343
:digraph ms 8344
:digraph ns 8345
:digraph os 8338
:digraph ps 8346
" :digraph sq
:digraph rs 7523
:digraph ss 8347
:digraph ts 8348
:digraph us 7524
:digraph vs 7525
":digraph ws 
:digraph xs 8339
":digraph ys 
":digraph zs


augroup greek_chars
    "You can also get these with diagrapsh
    inoremap a α
    inoremap b β
    inoremap g γ
    inoremap d δ
    inoremap e ε
    inoremap z ζ
    inoremap h η
    inoremap t θ
    inoremap i ι
    inoremap k κ
    inoremap l λ
    inoremap m μ
    inoremap n ν
    inoremap x ξ
    "Omicron is bound to a weird letter
    inoremap y ο
    inoremap p π
    inoremap r ρ
    inoremap s σ
    "Tau is bound to a weird letter
    inoremap q τ
    inoremap u υ
    inoremap j φ
    "Phi is bound to a weird letter
    inoremap c χ
    "Psi is bound to a weird letter
    inoremap w ψ
    inoremap o ω

    inoremap A Α
    inoremap B Β
    inoremap G Γ
    inoremap D Δ
    inoremap E Ε
    inoremap Z Ζ
    inoremap H Η
    inoremap T Θ
    inoremap I Ι
    inoremap K Κ
    inoremap L Λ
    inoremap M Μ
    inoremap N Ν
    inoremap X Ξ
    "Omicron is bound to a weird letter
    inoremap Y Ο
    inoremap P Π
    inoremap R Ρ
    inoremap S Σ
    "Tau is bound to a weird letter
    inoremap Q Τ
    inoremap U Υ
    inoremap J Φ
    "Phi is bound to a weird letter
    inoremap C Χ
    "Psi is bound to a weird letter
    inoremap W Ψ
    inoremap O Ω

    "abcdefghijklmnopqrstuvwxyz
    "αβχδεfγηιφκλμνωπτρσθυvψξοζ

    "ABCDEFGHIJKLMNOPQRSTUVWXYZ
    "ΑΒΧΔΕFΓΗΙΦΚΛΜΝΩΠΤΡΣΘΥVΨΞΟΖ

augroup END
"}}}
