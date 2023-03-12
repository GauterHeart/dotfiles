local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.load_extension("harpoon")
local picker_style = { theme = "dropdown" }

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
			"%.png",
			"__init__.py",
			"%.gif",
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = { theme = "dropdown", mappings = {} },
		live_grep = picker_style,
		buffers = picker_style,
		current_buffer_fuzzy_find = picker_style,
		diagnostics = picker_style,
		lsp_references = picker_style,
		treesitter = picker_style,
		git_branches = picker_style,
		git_commits = picker_style,
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		file_browser = {
			theme = "ivy",
			hijack_netrw = false,
			mappings = {
				i = {
					["<C-k>"] = function(prompt_bufnr)
						local selection = require("telescope.actions.state").get_selected_entry()
						local dir = vim.fn.fnamemodify(selection.path, ":p:h")
						require("telescope.actions").close(prompt_bufnr)
						-- Depending on what you want put `cd`, `lcd`, `tcd`
						vim.cmd(string.format("silent lcd %s", dir))
					end,
				},
				["n"] = {},
			},
		},
	},
})

telescope.load_extension("fzy_native")
telescope.load_extension("file_browser")

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

vim.keymap.set("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = true,
		git_status = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "insert",
		layout_config = { height = 40 },
	})
end)

vim.keymap.set("n", ";;", "<cmd>Telescope harpoon marks theme=dropdown<cr>")
