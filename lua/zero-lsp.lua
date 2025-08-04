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
   connected = {
      -- client_id is the ID of the Sonar LSP
      -- url is the url it wants to connect to
      get_credentials = function(client_id, url)
         -- This must return a string (User token)
         -- This is the default function. You can just set the environment variable.
         return vim.fn.getenv("SONAR_TOKEN")
      end,
   },
   server = {
      cmd = {
         'sonarlint-language-server',
         -- Ensure that sonarlint-language-server uses stdio channel
         '-stdio',
         '-analyzers',
         -- paths to the analyzers you need, using those for python and java in this example
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
      },
      settings = {
          sonarlint = {
              connectedMode = {
                  connections = {
                      sonarqube = {
                          {
                              connectionId = "https-sonar-gm-com",
                              -- this is the url that will go into get_credentials
                              serverUrl = "https://sonar.gm.com",
                              disableNotifications = true,
                          },
                      },
                      --sonarcloud = {
                      --    {
                      --        connectionId = "https://sonar.gm.com",
                      --        region = "US", -- or EU
                      --        organizationKey = "https-sonar-gm-com",
                      --        disableNotifications = false,
                      --    },
                      --},
                  },
              },
              pathToCompileCommands = "/home/yz17vh/repos/ipcg/build/compile_commands.json",
          }
      },
      before_init = function(params, config)
          -- Your personal configuration needs to provide a mapping of root folders and project keys
          --
          -- In the future a integration with https://github.com/folke/neoconf.nvim or some similar
          -- plugin, might be worthwhile.
          local project_root_and_ids = {
              ["/home/yz17vh/repos/ipcg"] = "com.gm.sdv:gminfo_vcu_qnx_gm_vpe-sv",
              -- … further mappings …
          }
          print("roothPath: " .. params.rootPath)
          print("project_key: " .. project_root_and_ids[params.rootPath])
          config.settings.sonarlint.connectedMode.project = {
              connectionId = "https-sonar-gm-com",
              projectKey = project_root_and_ids[params.rootPath],
          }
      end,
   },

   filetypes = {
      -- Tested and working
      'cpp',
   },
})
--sqp_14fa7a4c8481ec40cfdb08e29dbf2d83801fa69e
