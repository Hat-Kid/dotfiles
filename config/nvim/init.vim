set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

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

call plug#begin('~/.config/nvim/plugins')

Plug 'glepnir/dashboard-nvim'
Plug 'glepnir/spaceline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'NLKNguyen/papercolor-theme'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"
Plug 'nathanaelkane/vim-indent-guides'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'

call plug#end()

"indent plugin
let g:indent_guides_enable_on_vim_startup = 1

let g:spaceline_seperate_style = 'arrow'

"terminal colours
set t_Co=256

"theme
colorscheme PaperColor
set background=dark
let g:airline_theme='papercolor'

"line numbers
set number
set laststatus=2

""""""""""""""""""
"""(re)mappings"""
""""""""""""""""""
let mapleader = "\<Space>"
"swap j and k
nnoremap j k
nnoremap k j
" ° to move to start of line in nmode
nnoremap ° 0
"tab to indent lines in nmode
nnoremap <TAB> >>4l
nnoremap <S-TAB> <<4h
"enter inserts newline in nmode
nmap <CR> o<Esc>
"toggle nerdtree
nmap <leader>o :NERDTreeToggle<CR>
"source init.vim
nmap <leader>rr :so ~/.config/nvim/init.vim<CR>
