return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),

        ["<CR>"] = cmp.mapping.confirm({
          select = false,
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          -- Bei pacman-basierten Installationen heißt der Befehl oft qmlls6
          cmd = { "qmlls6" },
          filetypes = { "qml", "qmljs" },
        },
      },
    },
  },
  {
    "vyfor/cord.nvim",
  },
}
