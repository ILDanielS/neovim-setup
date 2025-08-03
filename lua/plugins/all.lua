return {
    {'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = {'nvim-lua/plenary.nvim'}, enable=true},
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
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    {"mbbill/undotree"},
    { "CopilotC-Nvim/CopilotChat.nvim", dependencies = {
        { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
        -- See Configuration section for options
    },
    { "https://gitlab.com/schrieveslaach/sonarlint.nvim"},
    -- See Commands section for default commands if you want to lazy load on them
},
}
