return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			local status, catppuccin = pcall(require, "catppuccin")
			if not status then
				return
			end

			vim.g.catppuccin_flavour = "mocha"
			catppuccin.setup({
				transparent_background = false,
				floating_border = "off",
				term_colors = true,
				compile = {
					enabled = true,
					path = vim.fn.stdpath("cache") .. "/catppuccin",
				},
				styles = {
					comments = { "italic" },
					properties = {},
					functions = { "bold" },
					keywords = {},
					operators = { "bold" },
					conditionals = { "bold" },
					loops = { "bold" },
					booleans = { "bold" },
					numbers = {},
					types = {},
					strings = {},
					variables = {},
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
					cmp = true,
					hop = true,
					telescope = true,
					harpoon = true,
					-- neotree = { enabled = true, show_root = false, border = false },
					mason = true,
					notify = true,
					gitsigns = true,
					telekasten = true,
				},
			})
		end,
	},
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("citruszest").setup({
				option = {
					transparent = false, -- Enable/Disable transparency
					bold = true,
					italic = false,
				},
				-- Override default highlight style in this table
				-- E.g If you want to override `Constant` highlight style
				style = {
					-- This will change Constant foreground color and make it bold.
					Constant = { fg = "#FFFFFF", bold = true },
				},
			})
		end,
	},
	{
		"samharju/synthweave.nvim",
		commit = "8e39d7a2d287fa01a8093afaa5da3f4554517d70",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		config = function()
			local synthweave = require("synthweave")
			synthweave.setup({
				transparent = false,
				overrides = {
					-- override any group
					Identifier = { fg = "#f22f52", italic = false },
				},
				palette = {
					-- override palette colors, take a peek at synthweave/palette.lua
					-- bg0 = "#040404",
				},
			})
			synthweave.load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				light_style = "day", -- The theme is used when the background is set to light
				transparent = false, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = false },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

				--- You can override specific color groups to use other groups or a hex color
				--- function will be called with a ColorScheme table
				---@param colors ColorScheme
				on_colors = function(colors) end,

				--- You can override specific highlights to use other groups or a hex color
				--- function will be called with a Highlights and ColorScheme table
				---@param highlights Highlights
				---@param colors ColorScheme
				on_highlights = function(highlights, colors) end,
			})
		end,
	},
}
