call plug#begin()
"Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
"Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
"Plug 'romgrk/barbar.nvim'
"Plug 'ellisonleao/gruvbox.nvim'
"Plug 'preservim/nerdtree'
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"call plug#end()


"set background=dark
"colorscheme gruvbox
colorscheme catppuccin-macchiato " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif


