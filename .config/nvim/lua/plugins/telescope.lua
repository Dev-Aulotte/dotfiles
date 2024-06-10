return {
    {
        "nvim-telescope/telescope.nvim",
        optional = true,
        opts = function(_, opts)
            local action = require "telescope.actions"

            opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
                mappings = {
                    i = {
                        ["<C-j>"] = action.move_selection_next,
                        ["<C-k>"] = action.move_selection_previous,
                    },
                },
            })
        end,
    },
}
