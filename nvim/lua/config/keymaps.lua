-- local discipline = require("noctua.discipline")
--
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "jj", "<ESC>")

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Harpoon
local harpoon = require("harpoon")

keymap.set("n", "<Leader>hm", function()
  harpoon:list():append()
end, { noremap = true, silent = true, desc = "Add current file to harpoon" })
keymap.set("n", "<Leader>he", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { noremap = true, silent = true, desc = "List harpoon files" })
keymap.set("n", "<Leader>ha", function()
  harpoon:list():select(1)
end, { noremap = true, silent = true, desc = "Go to file 1" })
keymap.set("n", "<Leader>hs", function()
  harpoon:list():select(2)
end, { noremap = true, silent = true, desc = "Go to file 2" })
keymap.set("n", "<Leader>hd", function()
  harpoon:list():select(3)
end, { noremap = true, silent = true, desc = "Go to file 3" })
keymap.set("n", "<Leader>hf", function()
  harpoon:list():select(4)
end, { noremap = true, silent = true, desc = "Go to file 4" })
keymap.set("n", "<Leader>hg", function()
  harpoon:list():select(5)
end, { noremap = true, silent = true, desc = "Go to file 5" })
keymap.set("n", "<Leader>hh", function()
  harpoon:list():select(6)
end, { noremap = true, silent = true, desc = "Go to file 6" })
keymap.set("n", "<Leader>hj", function()
  harpoon:list():select(7)
end, { noremap = true, silent = true, desc = "Go to file 7" })
keymap.set("n", "<Leader>hk", function()
  harpoon:list():select(8)
end, { noremap = true, silent = true, desc = "Go to file 8" })
keymap.set("n", "<Leader>hl", function()
  harpoon:list():select(9)
end, { noremap = true, silent = true, desc = "Go to file 9" })

keymap.set("n", "<Leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

keymap.set("n", "<Leader>j", ":lua require('treesj').toggle()<CR>", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("noctua.utils").replaceHexWithHSL()
end)
