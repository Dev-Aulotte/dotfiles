return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
  },
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Harpoon Deez Nuts",
    },
    {
      "<leader>he",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Show me Deez Nuts",
    },
    {
      "<leader>hh",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon to File 1",
    },
    {
      "<leader>hj",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon to File 2",
    },
    {
      "<leader>hk",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon to File 3",
    },
    {
      "<leader>hl",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon to File 4",
    },
  },
}
