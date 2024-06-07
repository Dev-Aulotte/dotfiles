local keymap = vim.keymap

keymap.set("n", "+", "<C-a>", { desc = "Increment" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement" })

keymap.set("n", "<leader>gn", ":Neogit<CR>", { desc = "Neogit" })
