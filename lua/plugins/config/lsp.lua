local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')


local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)

  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp_zero.on_attach(on_attach)

lsp_zero.extend_lspconfig({
  sign_text = true,
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'gopls', 'ast_grep' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- require('mason-lspconfig').setup_handlers {
--   ['rust_analyzer'] = function() end,
-- }

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  formatting = lsp_zero.cmp_format({ details = false }),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lsp_config.dartls.setup({
  on_attach = on_attach,
  --capabilities = capabilities,
  --init_options = {
  --	  onlyAnalyzeProjectsWithOpenFiles = false,
  --	  suggestFromUnimportedLibraries = true,
  --	  closingLabels = true,
  --	  outline = false,
  --	  flutterOutline = false,
  --},
  --filetypes = { "dart" },
  --settings = {
  --   		dart = {
  --     			analysisExludedForlders = {
  --       			vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
  --       			vim.fn.expand("$HOME/.pub-cache"),
  --       			vim.fn.expand("$HOME/tools/flutter"),
  --       			vim.fn.expand("/opt/homebrew"),
  --     			},
  --      		updateImportsOnRename = true,
  --		completeFunctionCalls = true,
  --		showTodos = true,
  --   		}
  -- 	}
})

lsp_config.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      -- Enable all features
      cargo = { allFeatures = true },
      -- Run clippy on save
      checkOnSave = { command = "clippy" },
      -- Additional settings can be added here
    }
  }
})


lsp_config.csharp_ls.setup({
  cmd = { "C:\\Users\\olivi\\.dotnet\\tools\\csharp-ls.EXE" }, 
  on_attach = on_attach,

  root_dir = function(fname)
          -- Look for .sln or .csproj files to determine the root
          return lsp_config.util.root_pattern("*.sln", "*.csproj")(fname) or lsp_config.util.path.dirname(fname)
    end,
  capabilities = capabilities,
})

-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     ['rust_analyzer'] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- })

---- Reserve a space in the gutter
--vim.opt.signcolumn = 'yes'
--
---- Add cmp_nvim_lsp capabilities settings to lspconfig
---- This should be executed before you configure any language server
--local lspconfig_defaults = require('lspconfig').util.default_config
--lspconfig_defaults.capabilities = vim.tbl_deep_extend(
--  'force',
--  lspconfig_defaults.capabilities,
--  require('cmp_nvim_lsp').default_capabilities()
--)
--
---- This is where you enable features that only work
---- if there is a language server active in the file
--vim.api.nvim_create_autocmd('LspAttach', {
--  desc = 'LSP actions',
--  callback = function(event)
--    local opts = {buffer = event.buf}
--
--    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
--  end,
--})
--
---- You'll find a list of language servers here:
---- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
---- These are example language servers.
--require('lspconfig').tsserver.setup({})
--require('lspconfig').gopls.setup({})
--
--local cmp = require('cmp')
--
--cmp.setup({
--  sources = {
--    {name = 'nvim_lsp'},
--  },
--  snippet = {
--    expand = function(args)
--      -- You need Neovim v0.10 to use vim.snippet
--      vim.snippet.expand(args.body)
--    end,
--  },
--  mapping = cmp.mapping.preset.insert({}),
--})
-- local lsp_zero = require('lsp-zero')
--
-- lsp_zero.on_attach(function(client, bufnr)
--   -- see :help lsp-zero-keybindings
--   -- to learn the available actions
--   lsp_zero.default_keymaps({ buffer = bufnr })
-- end)
--
-- -- see :help lsp-zero-guide:integrate-with-mason-nvim
-- -- to learn how to use mason.nvim with lsp-zero
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   handlers = {
--     lsp_zero.default_setup,
--   }
-- })
--
--
-- local nvim_lsp = require('lspconfig')
-- nvim_lsp.denols.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }
--
-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("package.json"),
--   single_file_support = false
-- }
--
-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
-- cmp.setup({
--   sources = {
--     { name = 'path' },
--     { name = 'nvim_lsp' },
--     { name = 'nvim_lua' },
--     { name = 'luasnip', keyword_length = 2 },
--     { name = 'buffer',  keyword_length = 3 },
--   },
--   formatting = lsp_zero.cmp_format(),
--   mapping = cmp.mapping.preset.insert({
--     ['<C-i>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-u>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     ['<C-Space>'] = cmp.mapping.complete(),
--   }),
-- })
--
-- lsp_zero.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['astro-ls'] = { "astro-ls", "--stdio" },
--     ['tsserver'] = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--     ['rust_analyzer'] = { 'rust' },
--     ['lua_ls'] = { 'lua' }
--   }
-- })
--
-- --[[ Primeagen config
-- local lsp_zero = require('lsp-zero')
--
-- lsp_zero.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }
--
--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end)
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls' },
--   handlers = {
--     lsp_zero.default_setup,
--     lua_ls = function()
--       local lua_opts = lsp_zero.nvim_lua_ls()
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   }
-- })
--
-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
-- cmp.setup({
--   sources = {
--     { name = 'path' },
--     { name = 'nvim_lsp' },
--     { name = 'nvim_lua' },
--     { name = 'luasnip', keyword_length = 2 },
--     { name = 'buffer',  keyword_length = 3 },
--   },
--   formatting = lsp_zero.cmp_format(),
--   mapping = cmp.mapping.preset.insert({
--     ['<C-i>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-u>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     ['<C-Space>'] = cmp.mapping.complete(),
--   }),
-- })
--
-- lsp_zero.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['biome'] = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--     ['rust_analyzer'] = { 'rust' },
--     ['lua_ls'] = { 'lua' }
--   }
-- })
-- ]]
