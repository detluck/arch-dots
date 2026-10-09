-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set by LazyVim: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable codelens
vim.lsp.codelens.enable(false)

-- -----------------------------------------------------------
-- ThePrimeagen Ergonomic Options
-- -----------------------------------------------------------
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor for context
vim.opt.updatetime = 50 -- Faster completion and CursorHold
vim.opt.colorcolumn = "80" -- Visual column guide at 80 characters
vim.opt.undofile = true -- Persistent undo history
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo" -- Centralized undo directory
