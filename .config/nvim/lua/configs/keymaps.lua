vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })

-- Save
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit file" })

-- Buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })

-- Keep it centered
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous match" })

-- Yank, Cut, Paste
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Paste without yanking selection" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Cut to clipboard" })

-- Neogit
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit" })

-- Lazy keymaps
vim.keymap.set("n", "<leader>l-", ":Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>li", ":Lazy install<CR>", { desc = "Lazy Install" })
vim.keymap.set("n", "<leader>lm", ":Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>lM", ":MasonUpdate<CR>", { desc = "Mason Update" })
vim.keymap.set("n", "<leader>ls", ":Lazy sync<CR>", { desc = "Lazy Sync" })
vim.keymap.set("n", "<leader>lu", ":Lazy update<CR>", { desc = "Lazy Upadte" })
