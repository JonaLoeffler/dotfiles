syntax on
filetype plugin indent on

set exrc " source external .vimrc files
set guicursor= " block cursor on insert mode
set nu " show line number
set relativenumber " show relative line numbers
set nohlsearch " no search highlights
set hidden " keep files open in buffers
set noerrorbells " stay silent
set nowrap " no line wraps

" searching
set smartcase " case matching in searches
set ignorecase " case matching in searches
set incsearch

" better tab handling
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" history
set noswapfile
set nobackup
set undodir=~/.cache/vim/undodir
set undofile

" line length indicator
set signcolumn=yes
set colorcolumn=120

set scrolloff=8
set completeopt=menuone,noinsert,noselect
" set noshowmode

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox

let mapleader = " "
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let NERDTreeShowHidden=1

lua << END
require'lualine'.setup{
    options = {
        theme = 'gruvbox'
    }
}
END

" Remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Autocommands
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end

