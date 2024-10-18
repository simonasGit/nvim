require("config.autocmds")
require("config.options")
require("config.keymaps")
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
require("config.lazy")
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")
-- dofile(vim.g.base46_cache .. "syntax")
-- dofile(vim.g.base46_cache .. "treesitter")
-- make persist after running :colo
-- gruvbox >> variable; then run below:
-- or nvchad switcher
