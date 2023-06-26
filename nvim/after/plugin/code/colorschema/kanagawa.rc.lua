local status, kanagawa = pcall(require, "kanagawa")
if not status then
	return
end

kanagawa.setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = false, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	-- blend = vim.o.pumblend,
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
})
