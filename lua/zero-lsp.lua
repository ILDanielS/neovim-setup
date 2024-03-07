local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = {
      'clangd',
      'lua_ls',
      'rust_analyzer',
  },
  handlers = {
    lsp_zero.default_setup,
  }
})
require'lspconfig'.clangd.setup{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.rust_analyzer.setup{}
--require'lspconfig'.lua_language_server.setup{}
