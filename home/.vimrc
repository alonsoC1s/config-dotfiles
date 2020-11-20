syntax on

set encoding=utf-8
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
set hidden " hidden buffers
set noshowmode " Quita el --INSERT-- inecesario
" Plugins "

" Vimtex. Imperativo que vaya antes de plugin load
let g:vimtex_imaps_leader = '@'


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

let maplocalleader=" "
let mapleader=","

" NerdTree 
map <C-ñ> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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
let g:airline#extensions#ale#enabled = 1

" vimtex
let g:tex_flavor = 'latex'
set conceallevel=2
let g:tex_conceal_frac=1
let g:tex_conceal='abdgm'
let g:vimtex_view_method='zathura'

let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

" ALE
let g:ale_linters = {
\	'python': ['pylint', 'flake8'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'yapf'],
\}

let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_change = 1
nmap <F10> :ALEFix<CR>

" Map movement through errors without wrapping.
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)

" Toggle ALE quick list
noremap <Leader>ñ :call QFixToggle()<CR>

function! QFixToggle()
  if exists("g:qfix_win")
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
 
" Remaps de ThePrimogean
" Remaps para ventanas
map <leader>h :wincmd h<CR> " window left
map <leader>l :wincmd l<CR> " window right
map <leader>j :wincmd j<CR> " window down
map <leader>k :wincmd k<CR> " window up
map <leader>q :wincmd q<CR> " window quit
