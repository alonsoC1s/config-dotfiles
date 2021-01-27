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
" Auto-wrapping de ancho de texto
set formatoptions+=aw
set tw=100 " Preferencia de pylint y prospector
set nobackup
set nowritebackup
" set cmdheight=2 " sugerido por coc
set updatetime=300 " Sugerencias más rápidas por Coc
" Folding
set foldmethod=syntax

let maplocalleader=" "
let mapleader=","


" Plugins "

" Vimtex. Imperativo que vaya antes de plugin load
let g:vimtex_imaps_leader = '@'
" ALE configuracion con Coc. Va antes del load
let g:ale_disable_lsp = 1

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
nmap <localleader>rn <Plug>(coc-rename)

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
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.dirty='!'

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
\	'python': ['flake8', 'prospector'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'yapf'],
\}

let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_change = 1
nmap <F10> :ALEFix<CR>
let g:ale_echo_msg_format = '%linter% says: %s'

" Map movement through errors without wrapping.
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)

" Toggle ALE quick list
" noremap <Leader>f :call QFixToggle()<CR> " Comentado porque no funciona y no
" se de dónde salió
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '❯'

" WhickKey
nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
nnoremap <silent> <localleader> :WhichKey '<localleader>'<CR>
set timeoutlen=500

" Floterm
let g:floaterm_height=0.95
let g:floaterm_width=0.95
let g:floaterm_autoclose=1
" Remaps útiles. Toggle está repetido a propósito
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
" remaps t
" nnoremap   <silent>   <localleader>tt   :FloatermToggle<CR>
nnoremap   <silent>   <localleader>tp   :FloatermNew --width=0.5 --wintype=normal --position=right ipython<CR>
nnoremap   <silent>   <localleader>tr   :FloatermNew --width=0.5 --wintype=normal --position=right <CR>
nnoremap   <silent>   <localleader>ta   :FloatermRepl<CR>
nnoremap   <silent>   <localleader>th   :FloatermNew htop<CR>
" tnoremap <Esc> <C-\><C-n>

" " Remaps de ThePrimogean
" " Remaps para ventanas
map <leader>j :wincmd j<CR> " window down
map <leader>k :wincmd k<CR> " window up
map <leader>q :wincmd q<CR> " window quit
map <C-h> :wincmd h<CR>
map <C-l> :wincmd l<CR>
" remaps necesarios para poder moverse igual en terminal mode
tnoremap <C-h> <C-\><C-n>:wincmd h<CR>
tnoremap <C-l> <C-\><C-n>:wincmd l<CR>

hi Normal guibg=NONE ctermbg=NONE
" hi Floaterm guibg=NONE guifg=NONE ctermbg=NONE
