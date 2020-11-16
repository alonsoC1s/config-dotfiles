syntax on

set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set smartcase
set noswapfile
set noerrorbells
set incsearch
set smartindent
set vb t_vb= " Disable bell sonds
" Plugins "

" Install and run vim-plug on first run

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

so ~/.vim/plugins.vim

" C-s to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

let mapleader=" "

" NerdTree 
map <C-o> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Fuzzyfinder
map <C-p> :Files<CR>

" ci-dark theme
syntax on
set termguicolors
colorscheme ci_dark

" Airline
let g:airline_theme = 'ci_dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Remaps de ThePrimogean
" Remaps para ventanas
map <leader>h :wincmd h<CR> " window left
map <leader>l :wincmd l<CR> " window right
map <leader>j :wincmd j<CR> " window down
map <leader>k :wincmd k<CR> " window up
map <leader>q :wincmd q<CR> " window quit
