return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup() -- = true?
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
    ensure_installed = {
    "gopls",
    },
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
     -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
    end,
  },
  { 'j-hui/fidget.nvim', opts = {} },
}
