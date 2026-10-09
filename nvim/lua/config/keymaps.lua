-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set by LazyVim: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- -----------------------------------------------------------
-- ThePrimeagen Signature Remaps & Workflow Superpowers
-- -----------------------------------------------------------

-- The Greatest Remap Ever:
-- Paste over selected text in visual mode WITHOUT replacing the yank register
map("x", "<leader>p", [["_dP]], { desc = "Paste Over (Keep Register)" })

-- Explicit System Clipboard (yanks to system clipboard, leaving local registers clean)
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to System Clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank Line to System Clipboard" })

-- Delete to void register (never pollutes clipboard/unnamed register)
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete (Void Register)" })

-- Move selected lines up/down in Visual mode with auto-indenting (Primeagen style)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

-- Join lines below without moving the cursor position
map("n", "J", "mzJ`z", { desc = "Join Lines (Keep Cursor)" })

-- Keep cursor vertically centered during half-page jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down (Centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up (Centered)" })

-- Keep search results centered and folds opened
map("n", "n", "nzzzv", { desc = "Next Search Match (Centered)" })
map("n", "N", "Nzzzv", { desc = "Prev Search Match (Centered)" })

-- Quick search & replace for the word under the cursor across the whole file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace Word Under Cursor" })

-- Make current file executable (chmod +x)
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File Executable" })

-- Better escape in insert mode
map("i", "<C-c>", "<Esc>", { desc = "Escape" })

-- Quickfix navigation with cursor centering
map("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous Quickfix (Centered)" })
map("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next Quickfix (Centered)" })

-- -----------------------------------------------------------
-- Custom Personal Keymaps
-- -----------------------------------------------------------
map("n", "g-t", "<cmd>tabnext<cr>", { desc = "Next Tab" })
