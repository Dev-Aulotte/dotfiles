return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
      { 'js-everts/cmp-tailwind-colors', opts = {} },
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect',
        },
        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm { select = false },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'copilot' },
          { name = 'path' },
          { name = 'buffer' },
        },
      }
    end,
  },
  -- "gc" to comment visual regions/lines
  { 'folke/todo-comments.nvim', opts = {} },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          'bash',
          'cmake',
          'css',
          'csv',
          'dot',
          'fish',
          'go',
          'gosum',
          'gowork',
          'gomod',
          'html',
          'http',
          'ini',
          'json',
          'jsonc',
          'lua',
          'luap',
          'luadoc',
          'make',
          'markdown',
          'markdown_inline',
          'php',
          'phpdoc',
          'javascript',
          'typescript',
          'tsx',
          'svelte',
          'scss',
          'sql',
          'ssh_config',
          'jsdoc',
          'python',
          'vim',
          'vimdoc',
          'xml',
          'yaml',
        },
      }
    end,
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      {
        'zbirenbaum/copilot.lua',
        config = function()
          require('copilot').setup {
            suggestion = { enabled = false },
            panel = { enabled = false },
          }
        end,
      },
    },
    config = function()
      require('copilot_cmp').setup()
    end,
  },

  {
    'numToStr/Comment.nvim',
    opts = {},
    event = { 'BufReadPre', 'BufNewFile' },
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup {
        use_default_keymaps = false,
      }

      vim.keymap.set('n', '<leader>cj', '<cmd>lua require("treesj").toggle()<CR>', { noremap = true, silent = true, desc = 'Split/Join' })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },

  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        names = true,
        tailwind = true,
      },
    },
  },

  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },
}
