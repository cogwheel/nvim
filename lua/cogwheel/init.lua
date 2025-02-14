require "cogwheel.remap"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

-- TODO: buffer/project-specific? Make a helper?
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- case-insensitive search unless \C or capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.timeoutlen = 3000 -- i am slow

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- TODO: this didn't seem to do anything
vim.opt.inccommand = 'split'

-- Someone somewhere said this was slow
vim.opt.cursorline = true

vim.opt.wrap = false

-- ThePrimeagen set these false, relying on undofile
-- Undofiles don't work in some cases, e.g. accessing a file through
-- a different path than normal (symlinks, moved, etc.)
vim.opt.swapfile = true
vim.opt.backup = true

vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir/"
vim.opt.undofile = true

--vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.colorcolumn = "80,120"

vim.g.have_nerd_font = true

if vim.g.neovide then
  -- Font is set in neovide config
  vim.g.neovide_scale_factor = 1.0
  vim.opt.linespace = 3
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line('$') then
      vim.cmd [[silent! normal! g`"]]
    end
  end
})
