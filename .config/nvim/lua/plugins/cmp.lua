return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<M-o>"] = cmp.mapping.confirm({ select = true }),
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.config.disable,
      })
      opts.experimental = {
        ghost_text = false,
      }
    end,
  },
}
