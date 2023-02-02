local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.load_extension("harpoon")
local picker_style = {theme = "dropdown"}

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules/.*",
			"venv/.*",
			"__pycache__/.*",
			".git/.*",
			"client/.*",
			"data/.*",
			"dist/.*",
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = picker_style,
		live_grep = picker_style,
		buffers = picker_style,
		current_buffer_fuzzy_find = picker_style,
		diagnostics = picker_style,
		lsp_references = picker_style,
		treesitter = picker_style,
		git_branches = picker_style,
		git_commits = picker_style,
	},
	extensions = {},
})

vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)

vim.keymap.set("n", ";r", function()
	builtin.live_grep()
end)

vim.keymap.set("n", "\\\\", function()
	builtin.buffers()
end)

vim.keymap.set("n", ";E", function()
	builtin.diagnostics()
end)

vim.keymap.set("n", ";e", function()
	builtin.diagnostics({ bufnr = 0 })
end)

vim.keymap.set("n", ";t", function()
	builtin.treesitter()
end)

vim.keymap.set("n", ";d", function()
	builtin.lsp_references()
end)

vim.keymap.set("n", ";gb", function()
	builtin.git_branches()
end)

vim.keymap.set("n", ";gc", function()
	builtin.git_commits()
end)
