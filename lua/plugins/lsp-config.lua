return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ansiblels", "arduino_language_server", "awk_ls", "bashls", 
          "cmake", "ast_grep", "dockerls", "biome", "grammarly", 
          "sqlls", "spectral",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    opts = {
      servers = {
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      for server, config in pairs(opts.servers) do
        -- Merge the default capabilities with the server-specific capabilities
        config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
        lspconfig[server].setup(config)
      end
    end,
  }
}
