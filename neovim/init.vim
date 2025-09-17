
lua << EOF

require("config.lazy")
require("lazy").setup({

   {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {

		neotree=true
	}
},
{
  "nyoom-engineering/oxocarbon.nvim"
  -- Add in any other configuration; 
  --   event = foo, 
  --   config = bar
  --   end,
},
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
{
    "mason-org/mason.nvim",
    opts = {}
},
{
	"neovim/nvim-lspconfig"
},
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
--{
    --'eddyekofo94/gruvbox-flat.nvim',
    --priority = 1000,
    --enabled = true,
    --config = function()
    --    vim.cmd([[colorscheme gruvbox-flat]])
  --  end,
--},
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
})
require('lspconfig').clangd.setup({})
require('lspconfig').rust_analyzer.setup {}
--vim.opt.background = "dark"
--vim.cmd.colorscheme = "oxocarbon"

EOF
colorscheme catppuccin-mocha
"colorscheme oxocarbon
set background=dark " or light if you want light mode

"colorscheme gruvbox
set termguicolors
lua << EOF

require('lualine').setup {

	options = 
	{
			theme="catppuccin-mocha"
	}

}
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
})
EOF


set rnu nu
