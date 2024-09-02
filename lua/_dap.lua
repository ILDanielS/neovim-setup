local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = {"-i", "dap"},
}

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/yz17vh/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to exec: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
    },
}

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })
