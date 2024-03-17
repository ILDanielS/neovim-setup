local opt = vim.opt

opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- indentation stuff
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.scrolloff = 8
opt.colorcolumn = "140"

-- copilot stuff
vim.cmd [[
    let g:copilot_workspace_folders = ["~/repos/ipcg/"]
]]
