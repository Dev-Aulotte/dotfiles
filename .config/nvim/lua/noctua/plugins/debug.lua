return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'jay-babu/mason-nvim-dap.nvim',
        config = function()
          require('mason-nvim-dap').setup {
            ensure_installed = {
              'delve',
            },
          }
        end,
      },
    },
  },
  {
    'leoluz/nvim-dap-go',
    ft = 'go',
    opts = {},
  },
}
