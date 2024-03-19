return {
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				keymaps = {
					-- Default keymap options
					noremap = true,
					buffer = true,
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage hunk" })
					map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
					map("v", "<leader>ghs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Stage hunk" })
					map("v", "<leader>ghr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Reset hunk" })
					map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage buffer" })
					map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
					map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset buffer" })
					map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview hunk" })
					map("n", "<leader>ghb", function()
						gs.blame_line({ full = true })
					end, { desc = "Blame line" })
					map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
					map("n", "<leader>ghd", gs.diffthis, { desc = "Diff current hunk" })
					map("n", "<leader>ghD", function()
						gs.diffthis("~")
					end, { desc = "Diff current hunk" })
					map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle deleted" })

					-- Text object
					map({ "o", "x" }, "gih", ":<C-U>Gitsigns select_hunk<CR>", { silent = true, desc = "Select hunk" })
				end,
			})
		end,
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = function()
			require("neogit").setup({})
			vim.keymap.set("n", "<Leader>gs", "<cmd>Neogit<CR>", { noremap = true, silent = true, desc = "[S]tatus" })
			vim.keymap.set(
				"n",
				"<Leader>gc",
				"<cmd>Neogit commit<CR>",
				{ noremap = true, silent = true, desc = "[C]ommit" }
			)
			vim.keymap.set(
				"n",
				"<Leader>gd",
				"<cmd>DiffviewOpen<CR>",
				{ noremap = true, silent = true, desc = "Diffview" }
			)
			vim.keymap.set(
				"n",
				"<Leader>gP",
				"<cmd>Neogit push<CR>",
				{ noremap = true, silent = true, desc = "[P]ush" }
			)
			vim.keymap.set(
				"n",
				"<Leader>gp",
				"<cmd>Neogit pull<CR>",
				{ noremap = true, silent = true, desc = "[P]ull" }
			)
			vim.keymap.set(
				"n",
				"<Leader>gF",
				"<cmd>Neogit fetch<CR>",
				{ noremap = true, silent = true, desc = "[F]etch" }
			)
		end,
	},
}
