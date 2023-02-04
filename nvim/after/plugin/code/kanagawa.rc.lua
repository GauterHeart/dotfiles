local status, kanagawa = pcall(require, "kanagawa")
if not status then
	return
end

kanagawa.setup({
	undercurl = false, -- enable utransparent = falsendercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	globalStatus = false, -- adjust window separators highlight for laststatus=3
	terminalColors = false, -- define vim.g.terminal_color_{0,17}
	colors = {},
	overrides = {},
	theme = "defautl", -- Load "default" theme or the experimental "light" theme
})

vim.cmd.colorscheme("kanagawa")
