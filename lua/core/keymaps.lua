-- Basic remaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigate windows 
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {} )
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {} )
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {} )
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {} )

-- Navigate tabs
vim.api.nvim_set_keymap("n", "<F2>", "<ESC>:tabnew<CR>", {})
vim.api.nvim_set_keymap("n", "<F3>", "gT", {})
vim.api.nvim_set_keymap("n", "<F4>", "gt", {})
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>q<cr>", {})

-- Vertical navigation
--    max 8 lines top // the primagen
--    center navigation when using {} --> zz
