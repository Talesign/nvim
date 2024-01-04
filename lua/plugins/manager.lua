local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
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
  {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x'
  },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  -- Plugins to test
  --
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }, },
  -- tpope/vim-commentary, -- Comments
  -- "vim-test/vim-test", -- Used for testing
  -- "lewis6991/gitsigns.nvim" -- Used for git changes (i think)
  -- preservim/vimux -- interact with tmux
  -- christoomey/vim-tmux-navigator -- tmux navigation
  -- fugitive -- Git commands directly in nvim
  -- tpope/vim-surround -- looks super useful - surrounds with parenthesis something
  -- L3MON4D3/LuaSnip -- creates snippets of code. the example shows comments
}

local opts = {}

require("lazy").setup(plugins, opts)
