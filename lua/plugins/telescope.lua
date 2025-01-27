return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files (telescope)" },
    { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "Find files in repo (telescope)" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep (telescope)" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers (telescope)" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags (telescope)" },
    { "<leader>ps", function() require("telescope.builtin").grep_string({
      search = vim.fn.input("Grep > ")
    }) end, desc = "Help tags (telescope)" },
  },
}
