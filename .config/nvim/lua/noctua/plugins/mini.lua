return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.align').setup()
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.files').setup()
      require('mini.hipatterns').setup()
      require('mini.indentscope').setup()
      require('mini.jump').setup()
      require('mini.jump2d').setup()
      require('mini.move').setup()
      require('mini.notify').setup()
      require('mini.pairs').setup()
      require('mini.splitjoin').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()

      vim.keymap.set('n', '<Leader>e', '<cmd>lua MiniFiles.open()<cr>', { desc = '[E]xplorer' })
    end,
  },
}
