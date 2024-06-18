vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "dadbod completion",
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
        require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
    end,
})
