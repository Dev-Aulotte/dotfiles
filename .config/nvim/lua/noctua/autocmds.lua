-- Yank highlightning
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- -- Autocommand to unfold all folds when opening a file
-- local unfold_folds = vim.api.nvim_create_augroup("UnfoldFolds", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
-- 	group = unfold_folds,
-- 	callback = function()
-- 		vim.cmd.normal("zR")
-- 	end,
-- })
