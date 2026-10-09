return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon: Add File",
    },
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon: Add File",
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon: Quick Menu",
    },
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon: Quick Menu",
    },
    -- Jump directly to pinned files 1-4 via Alt+1..4
    {
      "<M-1>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon: File 1",
    },
    {
      "<M-2>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon: File 2",
    },
    {
      "<M-3>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon: File 3",
    },
    {
      "<M-4>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon: File 4",
    },
    -- Fallback jump keys with Leader
    {
      "<leader>1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon: File 1",
    },
    {
      "<leader>2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon: File 2",
    },
    {
      "<leader>3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon: File 3",
    },
    {
      "<leader>4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon: File 4",
    },
    -- Prev/Next file in list
    {
      "<leader>hp",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon: Prev File",
    },
    {
      "<leader>hn",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon: Next File",
    },
  },
}
