
lua << EOF

require("config.lazy")
require("lazy").setup({

   {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
},
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
}
})
require('lspconfig').clangd.setup({})
--vim.opt.background = "dark"
--vim.cmd.colorscheme = "oxocarbon"

EOF
"colorscheme catppuccin-macchiato
colorscheme oxocarbon

set termguicolors
lua << EOF
require("bufferline").setup{
	options = {
		separator_style = "slope"
	}
}
vim.api.nvim_create_autocmd("VimEnter", {
	command="Neotree action=show"
})
EOF

