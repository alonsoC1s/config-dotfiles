call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

" LaTeX writing
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

" Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for tex conceal
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mhinz/vim-startify'

" Colorschemes
" Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
" Plug 'tjdevries/colorbuddy.nvim'
" Plug 'maaslalani/nordbuddy'
" Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/Colorizer'

" Statusbars
Plug 'hoob3rt/lualine.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'dense-analysis/ale'
Plug 'folke/which-key.nvim'

Plug 'jpalardy/vim-slime'

" LSP server configs
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
" Julia
Plug 'JuliaEditorSupport/julia-vim'
" Rust
Plug 'simrat39/rust-tools.nvim'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-omni'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'quangnguyen30192/cmp-nvim-ultisnips' " Completion for ultisnips
" Plug 'hrsh7th/vim-vsnip-integ'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'dhruvasagar/vim-table-mode'

Plug 'tpope/vim-commentary'
" Floating terminal
Plug 'voldikss/vim-floaterm'
" Plug 'alonsoC1s/vim-floaterm-repl'
call plug#end()
