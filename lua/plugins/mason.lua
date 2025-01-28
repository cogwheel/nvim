return {
  'williamboman/mason-lspconfig.nvim',
  opts = {
    ensure_installed = { 'lua_ls', 'clangd', 'rust_analyzer' },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    },
  },
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {},
    },
  },
}
