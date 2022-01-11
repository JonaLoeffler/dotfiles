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
set textwidth=80

set scrolloff=8
set completeopt=menuone,noinsert,noselect
" set noshowmode

set wildmenu
set wildignore=*/node_modules/*,*/.git/*,*/vendor/*
set path+=**

let mapleader = " "
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/commands.vim
source ~/.config/nvim/lsp-config.vim
luafile ~/.config/nvim/compe-config.lua

" Theme
colorscheme dracula
lua << END
require'lualine'.setup{
    options = {
        theme = 'dracula'
    }
}
END

" Remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" format paragraphs (comments)
nnoremap <leader>f gqip

