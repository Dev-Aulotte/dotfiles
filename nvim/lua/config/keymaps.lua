vim.g.mapleader = " "

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.backup = true
  vim.opt.cmdheight = 0
  vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
end

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font,Symbols Nerd Font Mono:h34"
  vim.g.neovide_scale_factor = 0.3
end

vim.opt.mousescroll = "ver:2,hor:6"

-- vim.g.node_host_prog = "/Users/folke/.pnpm-global/5/node_modules/neovim/bin/cli.js"
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- make all keymaps silent by default
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return keymap_set(mode, lhs, rhs, opts)
end
local keymap = vim.keymap
local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- x to delete without yanking
keymap.set("n", "x", '"_x', opts("Delete without yanking"))

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Increment number with + and decrement with -
keymap.set({ "n", "v" }, "+", "<C-a>", opts("Increment number"))
keymap.set({ "n", "v" }, "-", "<C-x>", opts("Decrement number"))

-- New line above and below without continuing comments
keymap.set("n", "<Leader>o", "o<ESC>Vc", opts("New line above"))
keymap.set("n", "<Leader>O", "O<ESC>Vc", opts("New line below"))

-- Move lines up and down
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts("Move line down"))
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts("Move line up"))

-- Move lines in visual modes
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts("Move line down"))
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts("Move line up"))

-- New tab
keymap.set("n", "te", ":tabedit", opts("New tab"))
keymap.set("n", "<tab>", ":tabnext<Return>", opts("Next tab"))
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts("Previous tab"))

-- Leader s to rename globally the word under the cursor
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  opts("Rename globally the word under the cursor")
)

-- Leader x to make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts("Make the current file executable"))

vim.keymap.set("i", "jk", "<ESC>", opts("jk to escape insert mode"))
