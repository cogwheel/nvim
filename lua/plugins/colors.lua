function SetTransparency()
  if vim.g.neovide then
    -- use global transparency for gui
    --vim.g.neovide_transparency = 0.95
    vim.g.neovide_normal_opacity = 0.95
  else
    -- use terminal background color
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    --vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    --vim.api.nvim_set_hl(0, 'NormalFloatNC', { bg = 'none' })

    vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' })
    --vim.api.nvim_set_hl(0, 'NeoTreeFloatNormal', { bg = 'none' })
  end
end

-- Use transparent background color
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = SetTransparency,
})

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd.colorscheme('tokyonight-night')
  end,
}
