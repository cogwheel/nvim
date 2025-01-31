vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Open file browser
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw - from theprimeagen' })

-- Move selected block up or down
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv")

-- Paste over while preserving paste
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"_dP', { desc = '[d]elete without yanking and [p]aste' })

-- Delete to null
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = '[d]elete without yanking' })

-- Disable annoying command mode
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear highlights with escape' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'quickfix' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys
function DisableArrow(arrow)
  vim.keymap.set('n', arrow,
    function() vim.notify("Don't use arrow keys to move", vim.log.levels.ERROR, { title = "War crimes" }) end,
    { desc = 'Disable ' .. arrow })
end

DisableArrow('<left>')
DisableArrow('<up>')
DisableArrow('<down>')
DisableArrow('<right>')

function CodeActionOnly(kind)
  vim.lsp.buf.code_action { context = { only = { kind } } }
end

vim.keymap.set({ 'n', 'v' }, '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = '[c]ode [a]ction' })
vim.keymap.set({ 'n', 'v' }, '<leader>c<S-F>', function() CodeActionOnly("quickfix") end, { desc = '[c]ode [F]ix' })
vim.keymap.set({ 'n', 'v' }, '<leader>c<S-R>', function() CodeActionOnly("refactor") end, { desc = '[c]ode [R]efactor' })

vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.rename() end, { desc = "[c]ode [r]ename" })
vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end,
  { desc = "[c]ode [f]ormat with LSP" })

-- Neovide: Zoom for neovide
if vim.g.neovide then
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
