local dap = require("dap")
--dap.adapters.gdb = {
--  type = "executable",
--  command = "gdb",
--  args = {"-i", "dap"},
--}

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/yz17vh/extension/debugAdapters/bin/OpenDebugAD7",
  options = { detached = false },
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
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    },
    {
        name = "Launch-slp",
        type = "cppdbg",
        request = "launch",
        program = "/home/yz17vh/repos/ipcg/build/bin/framework.signal_logic_processor_test",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    },
}

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })

require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
