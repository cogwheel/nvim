require "cogwheel.remap"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

-- TODO: buffer/project-specific? Make a helper?
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
--vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir/"
vim.opt.undofile = true

--vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 100
vim.opt.colorcolumn = "80,120"

if vim.g.neovide then
  -- Font is set in neovide config
  vim.g.neovide_scale_factor = 1.0
  vim.opt.linespace = 3
end
