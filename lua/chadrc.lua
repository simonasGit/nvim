local M = {}

M.base46 = {
  theme = 'gruvbox'
}

M.ui = {
  statusline = { theme = 'vscode' },
  tabufline = {
    enabled = true,
    lazyload = false,
    -- order = { "treeOffset", "buffers", "tabs", "btns" },
    -- modules = nil,
  },
}

return M
