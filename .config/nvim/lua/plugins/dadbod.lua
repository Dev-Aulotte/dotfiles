return {
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = "tpope/vim-dadbod",
        event = "VeryLazy",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "kristijanhusak/vim-dadbod-completion",
            },
        },
    },
}
