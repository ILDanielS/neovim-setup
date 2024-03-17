local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.adapters.cppdbg = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })
