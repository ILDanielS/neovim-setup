require('telescope').setup({
  defaults = {
    layout_config = {
      -- horizontal = { width = 0.9 , height = 0.9}
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  pickers = {
      lsp_references = {
          theme = "ivy",
          -- other lsp_references configuration here
      },
      lsp_document_symbols = {
          theme = "ivy",
          -- other lsp_document_symbols configuration here
      },
      git_files = {
          theme = "ivy",
          -- other find_files configuration here
      },

    -- other pickers configuration here
  },
  -- other configuration values here
})
