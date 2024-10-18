return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    opts = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
      -- auto_brackets = {}, -- configure any filetype to auto add brackets
        -- snippet = {
        --   expand = function(args)
        --     require("luasnip").lsp_expand(args.body)
        --   end,
        -- },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<A-i>"] = cmp.mapping.scroll_docs(-4),
          ["<A-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "luasnip" },
          { name = "buffer",  keyword_length = 2 },
          -- { name = "nvim_lua" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[λ]",
              -- luasnip = "[⋗]",
            },
          }),
        },
        experimental = {
          ghost_text = true,
        },
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        }
      })
    end,
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "onsails/lspkind.nvim",
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function()
  --     local ls = require("luasnip")
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --     vim.keymap.set("i", "<Tab>", function()
  --       if ls.expand_or_jumpable() then
  --         ls.expand_or_jump()
  --       else
  --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  --       end
  --     end)
  --   end,
  -- },
  -- "saadparwaiz1/cmp_luasnip",
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require("ultimate-autopair").setup({})
    end,
  },
  --
  "https://github.com/gpanders/nvim-parinfer",
}
