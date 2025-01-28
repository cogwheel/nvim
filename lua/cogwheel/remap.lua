vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Open file browser
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move selected block up or down
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv")

-- Paste over while preserving paste
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete to null
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

vim.keymap.set('n', 'Q', '<nop>')

-- format the doc
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format()
end)

-- Neovide: Zoom for neovide
if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0

  vim.keymap.set({ 'n', 'v', 'i', 'x' }, '<C-=>',
    function()
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
    end,
    { desc = "Neovide: Zoom in" }
  )

  vim.keymap.set({ 'n', 'v', 'i', 'x' }, '<C-->',
    function()
      if vim.g.neovide_scale_factor > 0.101 then
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
      end
    end,
    { desc = "Neovide: Zoom out" }
  )

  vim.keymap.set({ 'n', 'v', 'i', 'x' }, '<C-0>',
    function()
      vim.g.neovide_scale_factor = 1.0
    end,
    { desc = "Neovide: Reset zoom" }
  )
end
