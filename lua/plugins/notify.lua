return {
  'rcarriga/nvim-notify',
  lazy = false,
  priority = 900, -- less than colors
  config = function()
    vim.notify = require('notify')
  end,
}
