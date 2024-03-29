return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffCommand = "vimdiff"
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_SplitMinWidth = 30
    vim.g.undotree_SplitRight = 1
    vim.g.undotree_SplitBelow = 1
  end,
}
