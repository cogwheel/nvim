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
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, MakeOpts { desc = "LSP Hover" })
        vim.keymap.set('n', '<leader>id', function() vim.lsp.buf.definition() end, MakeOpts { desc = "Go to [d]efinition (LSP)" })
        vim.keymap.set('n', '<leader>iD', function() vim.lsp.buf.declaration() end, MakeOpts { desc = "Go to [D]eclaration (LSP)" })
        vim.keymap.set('n', '<leader>ii', function() vim.lsp.buf.implementation() end,
          MakeOpts { desc = "Go to [i]mplementation (LSP)" })
        vim.keymap.set('n', '<leader>it', function() vim.lsp.buf.type_definition() end,
          MakeOpts { desc = "Go to [t]ype definition (LSP)" })
        vim.keymap.set('n', '<leader>ir', function() vim.lsp.buf.references() end, MakeOpts { desc = "Show [r]eferences (LSP)" })
        -- TODO: figure out what signature help is :>
        vim.keymap.set('n', '<leader>is', function() vim.lsp.buf.signature_help() end,
          MakeOpts { desc = "Show [s]ignature help (LSP)" })

        local function do_code_action(kind)
          vim.lsp.buf.code_action { context = { only = { kind } } }
        end

        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = 'Do code [a]ction (LSP)' })
        vim.keymap.set('n', '<leader>c<S-F>', function() do_code_action("quickfix") end, { desc = 'Do code [F]ix (LSP)' })
        vim.keymap.set('n', '<leader>c<S-R>', function() do_code_action("refactor") end, { desc = '[c]ode [R]efactor (LSP)' })
        vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.rename() end, { desc = '[r]ename symbol (LSP)' })
        vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end,
          { desc = "[f]ormat code (LSP)" })
      end,
    })
  end,
}
