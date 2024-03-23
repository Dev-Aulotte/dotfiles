return {
  "Wansmer/treesj",
  keys = { "gm", "gj", "gS" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({--[[ your config ]]
    })
  end,
}
