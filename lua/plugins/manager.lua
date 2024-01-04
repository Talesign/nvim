-- [-] Try prichrd/netrw.nvim instead of nvim-tree - actually nvim-tree feels better
-- [x] Delete lua.bar
-- [x] Add a backgroun image
-- [-] Zen-mode - Non penso che lo installerò...
-- [ ] LSP - 
-- [ ] Fugitive
-- [x] Remaps for opening and closing panels 
-- [-] Treesitter - Palloso da fare su Win
-- [ ] Prettier

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
  
  -- { 'prichrd/netrw.nvim' },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nanozuki/tabby.nvim', event = 'VimEnter', dependencies = 'nvim-tree/nvim-web-devicons', "vim-test/vim-test" },
  -- tpope/vim-commentary, -- Comments
  -- "vim-test/vim-test", -- Used for testing
  -- "lewis6991/gitsigns.nvim" -- Used for git changes (i think)
  -- preservim/vimux -- interact with tmux 
  -- christoomey/vim-tmux-navigator -- tmux navigation
  -- fugitive -- Git commands directly in nvim
  -- tpope/vim-surround -- looks super useful - surrounds with parenthesis something
  -- hrsh7th/nvim-cmp -- auto-completition - really interesting
  -- /hrsh7th/cmp-nvim-lsp -- language server of nvim
  -- L3MON4D3/LuaSnip -- creates snippets of code. the example shows comments
  { 'rose-pine/neovim', name = 'rose-pine', priority = 1000 },

  -- { 'nvim-treesitter/nvim-treesitter' },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }, },
}

local opts = {}

require("lazy").setup(plugins,opt)
