vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Open file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected block up or down
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Paste over while preserving paste
vim.keymap.set("x", "<leader>p", '"_dP')

-- Delete to null
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)
