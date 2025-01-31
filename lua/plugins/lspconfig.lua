return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    -- Completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    -- Reserve a space in the gutter
    vim.opt.signcolumn = 'yes'

    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    local cmp = require('cmp')
    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = 'select' },
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = 'select' },

        ['<cr>'] = cmp.mapping.confirm { select = false },
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        ['<C-Space>'] = cmp.mapping.complete(),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    }

    -- Enable features that only work if there is a language server active
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local function MakeOpts(opts)
          opts = opts or {}
          opts.buffer = event.buf
          return opts
        end

        -- TODO: can these be defined in remap since they use the standard vim lsp stuff?
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', MakeOpts { desc = "LSP Hover" })
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', MakeOpts { desc = "[g]o to [d]efinition" })
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', MakeOpts { desc = "[g]o to [D]eclaration" })
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
          MakeOpts { desc = "[g]o to [i]mplementation" })
        vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
          MakeOpts { desc = "[g]o to [t]ype definition" })
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', MakeOpts { desc = "[g]o to [r]eferences" })
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
          MakeOpts { desc = "[g]o to [s]ignature help" })
      end,
    })
  end,
}
