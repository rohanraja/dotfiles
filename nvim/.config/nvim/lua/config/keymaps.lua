-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Reload current buffer with <Leader>r followed by 'e'
vim.api.nvim_set_keymap("n", "<Leader>re", [[:edit <CR>]], { noremap = true, silent = true })
