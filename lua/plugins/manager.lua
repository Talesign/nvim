-- plugin manager: lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'nvim-tree/nvim-tree.lua',
		version = "*",
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('nvim-tree').setup {}
	end,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
  --[[{
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },]]
  --[[{
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    -- config = funcion(),
 "vim-test/vim-test" }]]
  -- tpope/vim-commentary, -- Comments
  -- "vim-test/vim-test", -- Used for testing
  -- "lewis6991/gitsigns.nvim" -- Used for git changes (i think)
  -- preservim/vimux -- interact with tmux 
  -- christoomey/vim-tmux-navigator -- tmux navigation
  -- fugitive -- Git commands directly in nvim
  -- tpope/vim-surround -- looks super useful - surrounds with parenthesis something
  { 
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}

local opts = {}

require("lazy").setup(plugins,opt)
