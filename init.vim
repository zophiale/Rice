
lua << EOF

require("config.lazy")
require("lazy").setup({
--  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
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
{ "catppuccin/nvim", name = "catppuccin", priority = 1000}

})
vim.api.nvim_create_autocmd("VimEnter", {
  command = "Neotree action=show",
})
EOF
colorscheme catppuccin-macchiato
"autocm VimEnter NeoTree action=show 
