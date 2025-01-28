return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup {
        ensure_installed = {
          "c", "cpp", "lua", "vim", "vimdoc", "javascript", "html", "markdown", "python", "bash",
        },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      }
    end,
  },

  { "nvim-treesitter/playground" },
}
