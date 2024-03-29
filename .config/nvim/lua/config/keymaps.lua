local keymap = vim.keymap

-- Undo tree
keymap.set("n", "<leader>cu", ":UndotreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle undotree" })

-- Neogit
keymap.set("n", "<leader>gn", ":Neogit<CR>", { noremap = true, silent = true, desc = "Neogit" })
keymap.set("n", "<leader>gC", ":Neogit commit<CR>", { noremap = true, silent = true, desc = "Neogit Commit" })
keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { noremap = true, silent = true, desc = "Neogit Pull" })
keymap.set("n", "<leader>gP", ":Neogit push<CR>", { noremap = true, silent = true, desc = "Neogit Push" })
keymap.set("n", "<leader>gf", ":Neogit fetch<CR>", { noremap = true, silent = true, desc = "Neogit Fetch" })
keymap.set("n", "<leader>gb", ":Neogit branch<CR>", { noremap = true, silent = true, desc = "Neogit Branch" })

-- TreesJ
keymap.set("n", "gm", require("treesj").toggle, { noremap = true, silent = true, desc = "TreesJ Toggle" })
keymap.set("n", "gS", require("treesj").split, { noremap = true, silent = true, desc = "TreesJ Split" })
keymap.set("n", "gj", require("treesj").join, { noremap = true, silent = true, desc = "TreesJ Join" })
