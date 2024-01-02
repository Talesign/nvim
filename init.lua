-- here I want to add only the conf
-- note for tomorrow, add only the conf lmao
require("config")
require("config.remaps")
require("config.plugins")


local builtin = require('telescope.builtin')
vim.keymap.set('n','<leader>t',builtin.find_files, {})
