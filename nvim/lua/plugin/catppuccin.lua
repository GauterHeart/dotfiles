return {
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
}
