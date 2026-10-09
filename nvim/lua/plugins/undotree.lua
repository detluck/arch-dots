return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
  },
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 35
    vim.g.undotree_DiffpanelHeight = 10
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
