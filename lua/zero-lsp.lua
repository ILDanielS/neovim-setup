local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup()
require('mason-lspconfig').setup({
automatic_enable = {},
  ensure_installed = {
      'clangd',
      'lua_ls',
      'rust_analyzer',
      'cmake',
      'jsonls',
      'bashls',
  },
  handlers = {
    lsp_zero.default_setup,
  }
})
require'lspconfig'.clangd.setup{
    cmd =
    {
        "clangd",
        "--header-insertion=never",
    }
}
require'lspconfig'.cmake.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.bashls.setup{}

require('sonarlint').setup({
   server = {
      cmd = {
         'sonarlint-language-server',
         -- Ensure that sonarlint-language-server uses stdio channel
         '-stdio',
         '-analyzers',
         -- paths to the analyzers you need, using those for python and java in this example
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
      }
   },
   filetypes = {
      -- Tested and working
      'cpp',
   },
   settings = {
       sonarlint = {
           pathToCompileCommands = "~/repos/ipcg/build/compile_commands.json",
       }
   }
})
