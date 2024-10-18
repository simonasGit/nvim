local map = vim.keymap.set
-------------------------------------- keymaps ------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
--vim.opt.showmode = false

-- Clear highlights on search
map('n', '<Esc>', '<cmd>noh<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- LSP
map("n", "K", vim.lsp.buf.hover, {})
map("n", "<leader>gd", vim.lsp.buf.definition, {})
map("n", "<leader>gr", vim.lsp.buf.references, {})
map("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- Telescope
map("n", "<leader>f", "<cmd>Telescope file_browser<cr>")
map("n", "<leader>b", "<cmd>Telescope buffers<cr>") 
map("n", "<leader><leader>", "<cmd>Telescope<cr>")
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
--up&down
map("x", "<A-j>", ":move '>+1<CR>gv-gv", o)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", o)
