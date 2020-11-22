syntax on

set encoding=utf-8
set number relativenumber "Hybrid number mode
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
set nobackup
set nowritebackup
set cmdheight=2 " sugerido por coc
set updatetime=300 " Sugerencias más rápidas por Coc
" Folding
set foldmethod=indent

let maplocalleader=" "
let mapleader=","


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

" CoC Nvim
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" Remaps de ThePrimogean
" Remaps para ventanas
map <leader>h :wincmd h<CR> " window left
map <leader>l :wincmd l<CR> " window right
map <leader>j :wincmd j<CR> " window down
map <leader>k :wincmd k<CR> " window up
map <leader>q :wincmd q<CR> " window quit
