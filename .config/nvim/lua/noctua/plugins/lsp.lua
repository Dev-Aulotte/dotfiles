return {
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { { 'prettierd', 'prettier' } },
        php = { 'phpactor' },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      require('neodev').setup()

      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>cD', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        nmap('<leader>so', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>sO', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        nmap('<leader>cr', vim.lsp.buf.rename, '[R]e[n]ame')

        nmap('<leader>ca', function()
          vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
        end, '[C]ode [A]ction')

        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

        nmap('<Leader>cD', vim.lsp.buf.signature_help, 'Signature Documentation')
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local servers = {
        gopls = {},
        pyright = {},
        tsserver = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },

        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },

        phpactor = {
          cmd = { 'phpactor', 'language-server' },
          filetypes = { 'php' },
        },

        intelephense = {
          cmd = { 'intelephense', '--stdio' },
          filetypes = { 'php' },
        },
      }

      -- Ensure the servers above are installed
      require('mason').setup()

      local installed = { 'stylua', 'prettierd', 'isort', 'black' }
      vim.list_extend(installed, vim.tbl_keys(servers))
      require('mason-tool-installer').setup { ensure_installed = installed }
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            require('lspconfig')[server_name].setup {
              cmd = server.cmd,
              settings = server.settings,
              filetypes = server.filetypes,
              on_attach = on_attach,
              capabilities = server.capabilities or capabilities,
            }
          end,
        },
      }
    end,
  },
}
