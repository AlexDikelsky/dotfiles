" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Latex Stuff
Plug 'https://github.com/lervag/vimtex.git'

" Bash command stuff
Plug 'https://github.com/WolfgangMehner/vim-plugins'

" nerdtree
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()
