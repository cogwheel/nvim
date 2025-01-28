require "cogwheel.remap"

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.guifont = "IosevkaCogslabFixed Nerd Font:h13"
vim.opt.termguicolors = true

-- TODO: buffer/project-specific? Make a helper?
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
--vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir/"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 100
vim.opt.colorcolumn = "80"
