local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
-- system info
g.have_nerd_font = true

-- statusbar
o.ls = 3
o.smd = false
o.ch = 1

-- behavior
opt.whichwrap:append "<>[]hl"
o.clipboard = "unnamedplus"
o.cul = true
o.cursorlineopt = "number"
opt.scrolloff = 10
o.splitbelow = true
o.splitright = true
opt.inccommand = 'split' -- Preview substitutions live

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
opt.breakindent = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.nu = true
o.rnu = true
o.nuw = 2

o.signcolumn = "yes"

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250
o.timeoutlen = 400 -- Display which-key popup sooner
-- Save undo history
--o.undofile = true

-- add binaries installed by mason.nvim to path
--vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- disable default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
