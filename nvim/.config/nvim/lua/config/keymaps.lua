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

-- When jkjk is pressed in insert mode, first bring to normal mode and then save the file
vim.api.nvim_set_keymap("i", "kj", "<Esc>:w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "kj", "<Esc>:w<CR>", { noremap = true })

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
-- Map Leader + dec to run a shell command
vim.api.nvim_set_keymap("n", "<Leader>dec", ":!decode <cWORD><CR>", { noremap = true, silent = true })

-- On trigger of rr, run a lua function which checks if file is bash, then run it. If it is yaml then run it with kubectl

vim.api.nvim_set_keymap("n", "<Leader>rr", ":!run_file %<CR>", { noremap = true, silent = true })

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end)

vim.keymap.set("n", "<Leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<Leader>fh", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list

vim.keymap.set("n", "<Leader><Left>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<Leader><Right>", function()
  harpoon:list():next()
end)

-- Define a function to stage, amend commit, and push changes
local function git_stage_commit_push()
  -- Stage the current file
  vim.cmd("!git add %")
  -- Commit with amend. This will not prompt for a commit message edit.
  -- Remove '--no-edit' if you want to edit the commit message.
  vim.cmd("!git commit --amend --no-edit")
  -- Push changes to the server with safety checks.
  -- Adjust the branch and remote as necessary. Use --force-with-lease for safety.
  vim.cmd("!git push")
end

-- Map <leader>ggg to the git_stage_commit_push function
-- vim.api.nvim_set_keymap("n", "<leader>ggg", ":lua git_stage_commit_push()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>ga", function()
  git_stage_commit_push()
end)
