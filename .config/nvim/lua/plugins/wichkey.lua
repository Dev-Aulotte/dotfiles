return {
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").register({
        h = {
          name = "+Harpoon",
          _ = "which_key_ignore",
        },
      }, { prefix = "<leader>" })
    end,
  },
}
