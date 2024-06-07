return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "php",
                "phpdoc",
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                intelephense = {
                    cmd = { "intelephense", "--stdio" },
                    filetypes = { "php" },
                    root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
                },
                psalm = {
                    cmd = { "psalm", "--language-server" },
                    filetypes = { "php" },
                    root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
                },
            },
        },
    },
    -- Ensure PHP tools are installed
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "intelephense", "psalm", "pretty-php" })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        optional = true,
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = function(_, opts)
                    opts.ensure_installed = opts.ensure_installed or {}
                    vim.list_extend(opts.ensure_installed, { "pretty-php" })
                end,
            },
        },
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.builtins.formatting.pretty_php,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                php = { "pretty_php" },
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        optional = true,
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = function(_, opts)
                    opts.ensure_installed = opts.ensure_installed or {}
                    vim.list_extend(opts.ensure_installed, { "php-debug-adapter" })
                end,
            },
        },
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "olimorris/neotest-phpunit",
        },
        opts = {
            adapters = {
                ["neotest-phpunit"] = {},
            },
        },
    },
}
