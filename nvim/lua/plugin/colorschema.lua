return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			term_colors = true,
			transparent_background = false,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					-- crust = "#000000",
					crust = "#FFFFFF",
				},
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
		},
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
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- Enable transparent background
			-- transparent = true,
			transparent = false,

			-- Enable italics comments
			italic_comments = false,

			-- Replace all fillchars with ' ' for the ultimate clean look
			-- hide_fillchars = true,
			hide_fillchars = false,

			-- Modern borderless telescope theme
			borderless_telescope = true,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			theme = {
				variant = "default",
				highlights = {
					Comment = { fg = "#696969", bg = "NONE", italic = true },
					-- DiagnosticUnderlineError = { undercurl = true, sp = "#d11500" },
					DiagnosticUnderlineError = { underdouble = true, sp = "#d11500" },

					DiagnosticUnderlineWarn = { undercurl = false, sp = "#997b00" },
					DiagnosticUnderlineInfo = { undercurl = false, sp = "#0057d1" },
					DiagnosticUnderlineHint = { undercurl = false, sp = "#008c99" },
				},
			},
		},
	},
	{
		"samharju/serene.nvim",
		lazy = false,
		priority = 1000,
		commit = "e44be3b1c8a824c4c33d851fc92b02c3e893ec66",
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		commit = "6d206a3af7dd2e8389eecebab858e7d97813fc0c",
		config = function()
			require("lackluster").setup({
				disable_plugin = {
					git_gutter = true,
					git_signs = true,
					cmp = false,
				},
				tweak_background = {
					normal = "default", -- main background
					-- normal = 'none',    -- transparent
					-- normal = '#a1b2c3',    -- hexcode
					-- normal = color.green,    -- lackluster color
					telescope = "default", -- telescope

					menu = "none", -- nvim_cmp, wildmenu ... (bad idea to transparent)
					popup = "none", -- lazy, mason, whichkey ... (bad idea to transparent)
				},
			})
		end,
	},
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		commit = "c8f467af401de5356e2ca98388499489e8ad282f",
		opts = {},
		config = function()
			require("flow").setup({
				dark_theme = true, -- Set the theme with dark background.
				high_contrast = true, -- Make the dark background darker or the light background lighter.
				transparent = false, -- Set transparent background.
				fluo_color = "pink", -- Color used as fluo. Available values are pink, yellow, orange, or green.
				-- mode = "bright", -- Mode of the colors. Available values are: dark, bright, desaturate, or base.
				mode = "desaturate", -- Mode of the colors. Available values are: dark, bright, desaturate, or base.
				aggressive_spell = false, -- Use colors for spell check.
			})
		end,
	},
	{
		"diegoulloao/neofusion.nvim",
		lazy = false,
		priority = 1000,
		commit = "f1776ed91ed7aa605d7827ee498b06bd8bbc37b5",
		config = function()
			require("neofusion").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				palette_overrides = {
					dark0 = "#000000",
				},
				overrides = {
					DiagnosticUnderlineError = { underdouble = true, sp = "#d11500" },
					DiagnosticUnderlineWarn = { undercurl = false, sp = "#997b00" },
					DiagnosticUnderlineInfo = { undercurl = false, sp = "#0057d1" },
					DiagnosticUnderlineHint = { undercurl = false, sp = "#008c99" },
				},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
					migrations = false, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- VertSplit = { fg = "muted", bg = "muted" },
					DiagnosticUnderlineError = { underdouble = true, sp = "#d11500" },

					DiagnosticUnderlineWarn = { undercurl = false, sp = "#997b00" },
					DiagnosticUnderlineInfo = { undercurl = false, sp = "#0057d1" },
					DiagnosticUnderlineHint = { undercurl = false, sp = "#008c99" },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})
		end,
	},
}
