local autocmd = vim.api.nvim_create_autocmd

----------------------------------- autocommands ---------------------------------------
--  See `:help lua-guide-autocommands`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
