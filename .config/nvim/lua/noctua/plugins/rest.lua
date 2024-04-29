return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
    },
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    cmd = 'Rest',
    dependencies = {
      { 'luarocks.nvim' },
      {
        'AstroNvim/astrocore',
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = '<Leader>r'
          maps.n[prefix] = { desc = 'RestNvim' }
          maps.n[prefix .. 'r'] = { '<cmd>Rest run<cr>', desc = 'Run request under the cursor' }
          maps.n[prefix .. 'l'] = { '<cmd>Rest run last<cr>', desc = 'Re-run latest request' }
        end,
      },
    },
    main = 'rest-nvim',
    opts = {},
  },
}
