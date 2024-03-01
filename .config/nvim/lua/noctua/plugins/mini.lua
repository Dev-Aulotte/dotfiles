return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.bracketed').setup()
      require('mini.hipatterns').setup()
      require('mini.indentscope').setup()
    end,
  },
}
