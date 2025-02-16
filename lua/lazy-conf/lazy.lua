local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = {'nvim-lua/plenary.nvim'}, enable=true},
    {"ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" },},
    -- color scheme
    {'shaunsingh/nord.nvim', },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 , },
    {"folke/tokyonight.nvim",  lazy = false,  priority = 1000,  opts = {}},
    {'tpope/vim-fugitive'},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"nvim-treesitter/nvim-treesitter-context"},
    {"folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, },
    {"github/copilot.vim"},
    {"mfussenegger/nvim-dap"},
    {"mbbill/undotree"},
})

