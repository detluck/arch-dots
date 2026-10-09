return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "Gclog" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
    { "<leader>gS", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
    { "<leader>gP", "<cmd>Git pull --rebase<cr>", desc = "Git Pull (Rebase)" },
  },
  config = function()
    -- 3-Way merge conflict resolution shortcuts
    -- gu: get changes from target/left buffer (//2)
    -- gh: get changes from incoming/right buffer (//3)
    vim.keymap.set("n", "gu", "<cmd>diffget //2<cr>", { desc = "Diff: Get Left/Target (//2)" })
    vim.keymap.set("n", "gh", "<cmd>diffget //3<cr>", { desc = "Diff: Get Right/Incoming (//3)" })
  end,
}
