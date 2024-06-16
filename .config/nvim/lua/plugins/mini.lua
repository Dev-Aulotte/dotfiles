return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup {}
        require("mini.bracketed").setup {}
        require("mini.comment").setup {}
        require("mini.cursorword").setup {}
        require("mini.indentscope").setup {
            symbol = "|",
        }
        require("mini.move").setup {}
        require("mini.pairs").setup {}
        require("mini.splitjoin").setup {}
        require("mini.statusline").setup {}
    end,
}
