return {
  'echasnovski/mini.nvim',
  config = function()
    vim.opt.showmode = false

    local icons = require 'mini.icons'
    icons.setup{}

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- Too noisy
    statusline.section_git = function()
      return ''
    end
    statusline.section_diff = function()
      return ''
    end
    statusline.section_diagnostics = function()
      return ''
    end
    statusline.section_lsp = function()
      return ''
    end


    statusline.section_location = function()
      --return '%l/%L│%2v/%-2{virtcol("$") - 1}'
      return '%l│%-2v'
    end
  end,
}
