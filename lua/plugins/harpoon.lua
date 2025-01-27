local harpoon = function() return require("harpoon") end

local function toggle_telescope(harpoon_files)
    local conf = require("telescope.config").values
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    harpoon():setup()
  end,
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  keys = {
    {"<leader>a", function() harpoon():list():add() end},
    --{"<C-e>", function() harpoon().ui:toggle_quick_menu(harpoon():list()) end},
    {"<C-e>", function() toggle_telescope(harpoon():list()) end},

    {"<C-g>", function() harpoon():list():select(1) end},
    {"<C-c>", function() harpoon():list():select(2) end},
    {"<C-r>", function() harpoon():list():select(3) end},
    {"<C-l>", function() harpoon():list():select(4) end},

    {"<C-A-P>", function() harpoon():list():prev() end},
    {"<C-A-N>", function() harpoon():list():next() end},
  },
}
