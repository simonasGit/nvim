local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  checker = {
    enabled = true,
    notify = false, 
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

--  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
--    { -- Adds git related signs to the gutter, as well as utilities for managing changes
--    'lewis6991/gitsigns.nvim',
--    opts = {
--      signs = {
--        add = { text = '+' },
--        change = { text = '~' },
--        delete = { text = '_' },
--        topdelete = { text = '‾' },
--        changedelete = { text = '~' },
--      },
--    },
--  },
--
--  -- LSP Plugins
--  {
--    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
--    -- used for completion, annotations and signatures of Neovim apis
--    'folke/lazydev.nvim',
--    ft = 'lua',
--    opts = {
--      library = {
--        -- Load luvit types when the `vim.uv` word is found
--        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
--      },
--    },
--  },
--  { 'Bilal2453/luvit-meta', lazy = true },
--
--  { -- Autoformat
--    'stevearc/conform.nvim',
--    event = { 'BufWritePre' },
--    cmd = { 'ConformInfo' },
--    keys = {
--      {
--        '<leader>f',
--        function()
--          require('conform').format { async = true, lsp_format = 'fallback' }
--        end,
--        mode = '',
--        desc = '[F]ormat buffer',
--      },
--    },
--    opts = {
--      notify_on_error = false,
--      format_on_save = function(bufnr)
--        -- Disable "format_on_save lsp_fallback" for languages that don't
--        -- have a well standardized coding style. You can add additional
--        -- languages here or re-enable it for the disabled ones.
--        local disable_filetypes = { c = true, cpp = true }
--        local lsp_format_opt
--        if disable_filetypes[vim.bo[bufnr].filetype] then
--          lsp_format_opt = 'never'
--        else
--          lsp_format_opt = 'fallback'
--        end
--        return {
--          timeout_ms = 500,
--          lsp_format = lsp_format_opt,
--        }
--      end,
--      formatters_by_ft = {
--        lua = { 'stylua' },
--        -- Conform can also run multiple formatters sequentially
--        -- python = { "isort", "black" },
--        --
--        -- You can use 'stop_after_first' to run the first available formatter from the list
--        -- javascript = { "prettierd", "prettier", stop_after_first = true },
--      },
--    },
--  },
--
--
--  { -- You can easily change to a different colorscheme.
--    -- Change the name of the colorscheme plugin below, and then
--    -- change the command in the config to whatever the name of that colorscheme is.
--    --
--    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--    'folke/tokyonight.nvim',
--    priority = 1000, -- Make sure to load this before all the other start plugins.
--    init = function()
--      -- Load the colorscheme here.
--      -- Like many other themes, this one has different styles, and you could load
--      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--      vim.cmd.colorscheme 'tokyonight-night'
--
--      -- You can configure highlights by doing something like:
--      vim.cmd.hi 'Comment gui=none'
--    end,
--  },
--
--  -- Highlight todo, notes, etc in comments
--  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
--
--  { -- Collection of various small independent plugins/modules
--    'echasnovski/mini.nvim',
--    config = function()
--      -- Better Around/Inside textobjects
--      --
--      -- Examples:
--      --  - va)  - [V]isually select [A]round [)]paren
--      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--      --  - ci'  - [C]hange [I]nside [']quote
--      require('mini.ai').setup { n_lines = 500 }
--
--      -- Add/delete/replace surroundings (brackets, quotes, etc.)
--      --
--      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
--      -- - sd'   - [S]urround [D]elete [']quotes
--      -- - sr)'  - [S]urround [R]eplace [)] [']
--      require('mini.surround').setup()
--
--      -- Simple and easy statusline.
--      --  You could remove this setup call if you don't like it,
--      --  and try some other statusline plugin
--      local statusline = require 'mini.statusline'
--      -- set use_icons to true if you have a Nerd Font
--      statusline.setup { use_icons = vim.g.have_nerd_font }
--
--      -- You can configure sections in the statusline by overriding their
--      -- default behavior. For example, here we set the section for
--      -- cursor location to LINE:COLUMN
--      ---@diagnostic disable-next-line: duplicate-set-field
--      statusline.section_location = function()
--        return '%2l:%-2v'
--      end
--
--      -- ... and there is more!
--      --  Check out: https://github.com/echasnovski/mini.nvim
--    end,
--  },
--  { -- Highlight, edit, and navigate code
--    'nvim-treesitter/nvim-treesitter',
--    build = ':TSUpdate',
--    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--    opts = {
--      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
--      -- Autoinstall languages that are not installed
--      auto_install = true,
--      highlight = {
--        enable = true,
--        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--        --  If you are experiencing weird indenting issues, add the language to
--        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
--        additional_vim_regex_highlighting = { 'ruby' },
--      },
--      indent = { enable = true, disable = { 'ruby' } },
--    },
--    -- There are additional nvim-treesitter modules that you can use to interact
--    -- with nvim-treesitter. You should go explore a few and see what interests you:
--    --
--    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--  },
--
--  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
--  -- init.lua. If you want these files, they are in the repository, so you can just download them and
--  -- place them in the correct locations.
--
--  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
--  --
--  --  Here are some example plugins that I've included in the Kickstart repository.
--  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
--  --
--  -- require 'kickstart.plugins.debug',
--  -- require 'kickstart.plugins.indent_line',
--  -- require 'kickstart.plugins.lint',
--  -- require 'kickstart.plugins.autopairs',
--  -- require 'kickstart.plugins.neo-tree',
--  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
--
--  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--  --    This is the easiest way to modularize your config.
--  --
--  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
--  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
--  -- { import = 'custom.plugins' },
--}, {
--  ui = {
--    -- If you are using a Nerd Font: set icons to an empty table which will use the
--    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
--    icons = vim.g.have_nerd_font and {} or {
--      cmd = '⌘',
--      config = '🛠',
--      event = '📅',
--      ft = '📂',
--      init = '⚙',
--      keys = '🗝',
--      plugin = '🔌',
--      runtime = '💻',
--      require = '🌙',
--      source = '📄',
--      start = '🚀',
--      task = '📌',
--      lazy = '💤 ',
--    },
--  },
--})
-- vim: ts=2 sts=2 sw=2 et
