"disable escape timeout
set ttimeoutlen=0

"cursor shape change in normal/insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"override terminal colours
let &t_ut=''

"tab -> 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'

call plug#end()

set t_Co=256
set background=dark
colorscheme PaperColor
set number
set laststatus=2

let g:airline_theme='papercolor'
