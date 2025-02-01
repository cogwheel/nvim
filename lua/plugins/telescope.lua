local function builtin() return require("telescope.builtin") end

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  -- branch or tag
  --tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", function() builtin().find_files() end, desc = "Find [f]iles (telescope)" },
    { "<C-p>",      function() builtin().git_files() end,  desc = "Find files in repo (telescope)" },
    { "<leader>fg", function() builtin().live_grep() end,  desc = "Live [g]rep (telescope)" },
    { "<leader>fb", function() builtin().buffers() end,    desc = "[b]uffers (telescope)" },
    { "<leader>fh", function() builtin().help_tags() end,  desc = "[h]elp tags (telescope)" },
    {
      "<leader>fs",
      function()
        builtin().grep_string({
          search = vim.fn.input("Grep > ")
        })
      end,
      desc = "Find [s]tring (telescope)"
    },
  },
}
