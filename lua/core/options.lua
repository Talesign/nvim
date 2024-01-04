-- General commands
vim.opt.timeout = false
vim.opt.clipboard = "unnamedplus"
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.laststatus = 1
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.fillchars = {eob = " "}
vim.opt.cursorline = true
vim.g.netrw_banner = false
vim.g.netrw_sort_options = ""

-- Tabs
tab = 2
vim.opt.tabstop = tab
vim.opt.softtabstop = tab
vim.opt.shiftwidth = tab
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Text highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Numbers
vim.opt.relativenumber = true
vim.opt.number = true
