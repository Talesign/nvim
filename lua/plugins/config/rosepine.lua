vim.opt.laststatus = 3 -- Or 3 for global statusline
vim.opt.statusline = " %f %m %= %l:%c ♥ "

require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'moon',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- For reference: https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		-- Cursor line
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },

		-- Transparent backgroun
    Search = { bg = 'gold', inherit = false },
    Normal = { bg = 'none', inherit = false },
    NormalNC = { bg = 'none', inherit = false }, 

    TelescopeBorder = { fg = "love", bg = "Highlight Low" },
		TelescopeNormal = { fg = "overlay", bg = "none" }, 
		
    TelescopePromptTitle = { fg = "subtle", bg = "none" },
		TelescopePromptNormal = { fg = "subtle", bg = "none" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	}
})

vim.cmd('colorscheme rose-pine')
