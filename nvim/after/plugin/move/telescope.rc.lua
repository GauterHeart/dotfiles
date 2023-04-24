local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local theme = require("telescope.themes")
local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local function picker_style(etc)
	local config = {
		winblend = 0,
		border = true,
		shorten_path = false,
		heigth = 20,
		width = 120,
		prompt_title = "",
		preview_title = "",
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		},
	}
	for k, v in pairs(etc) do
		config[k] = v
	end

	return config
end

local picker = theme.get_dropdown(picker_style({ previewer = false }))
local picker_previewer = theme.get_dropdown(picker_style({ preview_title = "", previewer = true }))

telescope.setup({
	defaults = {
		-- history = {
		-- 	path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
		-- 	limit = 100,
		-- },
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
		find_files = picker,
		live_grep = picker_previewer,
		buffers = picker,
		current_buffer_fuzzy_find = picker,
		diagnostics = picker_previewer,
		lsp_references = picker_previewer,
		treesitter = picker_previewer,
		git_branches = picker,
		git_commits = picker,
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		file_browser = {
			theme = "dropdown",
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
		tele_tabby = {
			use_highlighter = true,
		},
	},
})

telescope.load_extension("harpoon")
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

vim.keymap.set("n", ";a", function()
	builtin.treesitter()
end)

vim.keymap.set("n", ";v", function()
	builtin.treesitter({
		symbols = {'var'}
	})
end)

vim.keymap.set("n", ";b", function()
	builtin.treesitter({
		symbols = {'type'}
	})
end)

vim.keymap.set("n", ";c", function()
	builtin.treesitter({
		symbols = {'function'}
	})
end)

vim.keymap.set("n", ";n", function()
	builtin.treesitter({
		symbols = {'field'}
	})
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
	telescope.extensions.file_browser.file_browser(picker_style({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = true,
		git_status = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "insert",
		-- layout_config = { height = 40 },
	}))
end)

vim.keymap.set("n", ";t", function()
	telescope.extensions.tele_tabby.list(picker)
end)

vim.keymap.set("n", ";;", function()
	telescope.extensions.harpoon.marks(picker)
end)

vim.keymap.set("n", "<F1>", function()
	builtin.resume()
end)
