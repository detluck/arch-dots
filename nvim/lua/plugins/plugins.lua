return {
  {
    "zbirenbaum/copilot.lua",
    event = "BufReadPost",
    cmd = "Copilot",
    build = ":Copilot auth",

    opts = function(_, opts)
      opts.suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,

        keymap = {
          accept = "<C-l>", -- Vorschlag annehmen
          next = "<C-j>", -- nächster Vorschlag
          prev = "<C-k>", -- vorheriger Vorschlag
          dismiss = "<C-c>", -- ablehnen
        },
      }

      opts.panel = { enabled = false }

      opts.filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",

    opts = function(_, opts)
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)

      opts.auto_insert_mode = true

      opts.headers = opts.headers or {}
      opts.headers.user = "  " .. user .. " "
      opts.headers.assistant = "  Copilot "
      opts.headers.tool = "󰊳  Tool "

      opts.window = opts.window or {}
      opts.window.width = 0.4
    end,

    keys = {
      { "<leader>jj", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Explain Code" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Fix Code" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = "v", desc = "Generate Tests" },
      { "<leader>cr", "<cmd>CopilotChatRefactor<cr>", mode = "v", desc = "Refactor" },

      -- Custom Prompt
      {
        "<leader>cq",
        function()
          vim.ui.input({ prompt = "Copilot: " }, function(input)
            if input then
              vim.cmd("CopilotChat " .. input)
            end
          end)
        end,
        desc = "Custom Prompt",
      },
    },
  },
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
}
