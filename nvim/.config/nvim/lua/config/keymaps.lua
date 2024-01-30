-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Reload current buffer with <Leader>r followed by 'e'
vim.api.nvim_set_keymap("n", "<Leader>re", [[:edit <CR>]], { noremap = true, silent = true })

-- Add this in your init.vim or init.lua file

-- Function to open the root folder of the current session in VSCode
function open_vscode()
  local root_directory = vim.fn.getcwd()

  local vscode_cmd = "code-insiders"
  local command = string.format("%s %s", vscode_cmd, root_directory)

  -- Open VSCode using the command
  vim.fn.system(command)
end

-- Map <Leader> + vs to open VSCode with the root directory
vim.api.nvim_set_keymap("n", "<Leader>vs", "<Cmd>lua open_vscode()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

require("oil").setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Save Changes
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Quit buffer
vim.api.nvim_set_keymap("n", "<Leader>w", ":bd<CR>", { noremap = true, silent = true })

-- Quit Neovim
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })

-- Remap Ctrl+Shift+Left to decrease window width
vim.api.nvim_set_keymap("n", "<C-S-Left>", "<C-W><", { noremap = true, silent = true })

-- Remap Ctrl+Shift+Right to increase window width
vim.api.nvim_set_keymap("n", "<C-S-Right>", "<C-W>>", { noremap = true, silent = true })

-- Remap Ctrl+Shift+Up to increase window height_opt
vim.api.nvim_set_keymap("n", "<C-S-Up>", "<C-W>+", { noremap = true, silent = true })

-- Remap Ctrl+Shift+Down to decrease window height_opt
vim.api.nvim_set_keymap("n", "<C-S-Down>", "<C-W>-", { noremap = true, silent = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.git_files, {})

-- Remap auto layout windows
-- vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>=", { noremap = true, silent = true })

-- Auto reload neovim config
vim.api.nvim_set_keymap("n", "<Leader>sv", ":luafile %<CR>", { noremap = true, silent = true })

-- vim.keymap.set("n", "jj", "<C-d>zz")
-- vim.keymap.set("n", "kk", "<C-u>zz")

--
