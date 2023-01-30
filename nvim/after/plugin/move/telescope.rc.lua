local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.load_extension("harpoon")

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
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
		},
		diagnostics = {
			theme = "dropdown",
		},
		lsp_references = {
			theme = "dropdown",
		},
		treesitter = {
			theme = "dropdown",
		},
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
