return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    local treesj = require 'treesj'
    treesj.setup {
      use_default_keymaps = false,
    }
    vim.keymap.set('n', 'gm', function()
      treesj.toggle { split = { recursive = true } }
    end, { desc = 'Toggle Merge/Split code' })
  end,
}
