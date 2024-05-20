return {
	{

		"nvim-telescope/telescope-file-browser.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local status, telescope = pcall(require, "telescope")
			if not status then
				return
			end
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local theme = require("telescope.themes")
			local lga_actions = require("telescope-live-grep-args.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			function table.shallow_copy(t)
				local t2 = {}
				for k, v in pairs(t) do
					t2[k] = v
				end
				return t2
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

			local base_file_ignore = {
				"node_modules/.*",
				"venv/.*",
				"__pycache__/.*",
				".git/.*",
				"vendor",
				-- "client/.*",
				"data/.*",
				"dist/.*",
				"%.png",
				"%.gif",
			}
			local without_pkg_ignore = {
				"__pycache__/.*",
				".git/.*",
				"vendor",
				-- "client/.*",
				"data/.*",
				"dist/.*",
				"%.png",
				"%.gif",
			}

			local standart_picker_file_ignore = table.shallow_copy(base_file_ignore)
			table.insert(standart_picker_file_ignore, "__init__.py")

			local picker = theme.get_dropdown(picker_style({ previewer = false }))
			local harpoon_picker =
				theme.get_dropdown(picker_style({ previewer = false, file_ignore_patterns = base_file_ignore }))
			local without_package_ignore_picker =
				theme.get_dropdown(picker_style({ previewer = false, file_ignore_patterns = without_pkg_ignore }))

			local picker_previewer = theme.get_dropdown(picker_style({ preview_title = "", previewer = true }))
			local picker_previewer_rg = theme.get_dropdown(picker_style({
				preview_title = "",
				previewer = true,
				file_ignore_patterns = base_file_ignore,
			}))
			local picker_buffer = theme.get_dropdown(picker_style({
				previewer = false,
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["<C-d>"] = actions.delete_buffer,
					},
				},
			}))

			-- local fd_picker = theme.get_dropdown(
			-- 	picker_style({
			-- 		previewer = false,
			-- 		find_command = { "fd", "-g", "--type", "f", "--strip-cwd-prefix", "-E", ".git", "-H" },
			-- 	})
			-- )

			telescope.setup({
				defaults = {
					-- history = {
					-- 	path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
					-- 	limit = 100,
					-- },
					file_ignore_patterns = standart_picker_file_ignore,
					mappings = {
						i = {
							["<esc>"] = actions.close,
							-- ["<C-k>"] = require("telescope.actions").cycle_history_next,
							-- ["<C-l>"] = require("telescope.actions").cycle_history_prev,
							["<C-k>"] = function(prompt_bufnr)
								local selection = require("telescope.actions.state").get_selected_entry()
								local dir = vim.fn.fnamemodify(selection.path, ":p:h")
								require("telescope.actions").close(prompt_bufnr)
								-- Depending on what you want put `cd`, `lcd`, `tcd`
								vim.cmd(string.format("silent lcd %s", dir))
							end,
						},
					},
				},
				pickers = {
					find_files = picker,
					quickfix = picker,
					quickfixhistory = picker,
					live_grep = picker_previewer,
					buffers = picker_buffer,
					current_buffer_fuzzy_find = picker,
					diagnostics = picker_previewer_rg,
					lsp_references = picker_previewer,
					treesitter = picker_previewer,
					git_branches = picker,
					git_commits = picker,
					git_status = picker,
				},
				extensions = {
					fzy_native = {
						override_generic_sorter = false,
						override_file_sorter = true,
					},
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-l>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
					},
					file_browser = {
						theme = "dropdown",
						hijack_netrw = false,
						file_ignore_patterns = base_file_ignore,
						mappings = {
							i = {
								["<C-k>"] = function(prompt_bufnr)
									local selection = require("telescope.actions.state").get_selected_entry()
									local dir = vim.fn.fnamemodify(selection.path, ":p:h")
									require("telescope.actions").close(prompt_bufnr)
									-- Depending on what you want put `cd`, `lcd`, `tcd`
									vim.cmd(string.format("silent lcd %s", dir))
								end,
								["<C-a>"] = fb_actions.create,
								-- ["<C-d>"] = fb_actions.remove,
								["<C-r>"] = fb_actions.rename,
							},
							["n"] = {
								["<C-a>"] = fb_actions.create,
								-- ["<C-d>"] = fb_actions.remove,
								["<C-r>"] = fb_actions.rename,
							},
						},
					},
					frecency = {
						theme = "dropdown",
					},
				},
			})

			telescope.load_extension("harpoon")
			-- telescope.load_extension("fzy_native")
			telescope.load_extension("file_browser")
			telescope.load_extension("live_grep_args")

			vim.keymap.set("n", ";f", function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
					-- search_dirs = {"directory", "directories", "files"}
					-- follow = true
				})
			end)

			vim.keymap.set("n", ";r", function()
				telescope.extensions.live_grep_args.live_grep_args(picker_previewer_rg)
			end)

			vim.keymap.set("n", ";j", function()
				builtin.current_buffer_fuzzy_find()
			end)

			vim.keymap.set("n", ";a", function()
				builtin.buffers({
					show_all_buffers = false,
					ignore_current_buffer = true,
					only_cwd = true,
					sort_lastused = true,
				})
			end)

			vim.keymap.set("n", ";E", function()
				builtin.diagnostics({ root_dir = true })
			end)

			vim.keymap.set("n", ";e", function()
				builtin.diagnostics({ bufnr = 0 })
			end)

			vim.keymap.set("n", ";s", function()
				builtin.treesitter()
			end)

			vim.keymap.set("n", ";v", function()
				builtin.treesitter({
					symbol_highlights = { "var" },
				})
			end)

			vim.keymap.set("n", ";b", function()
				builtin.treesitter({
					symbols = { "type" },
				})
			end)

			vim.keymap.set("n", ";c", function()
				builtin.treesitter({
					symbols = { "function" },
				})
			end)

			vim.keymap.set("n", ";n", function()
				builtin.treesitter({
					symbols = { "field" },
				})
			end)

			vim.keymap.set("n", ";d", function()
				builtin.lsp_references(picker_previewer_rg)
			end)

			vim.keymap.set("n", ";gb", function()
				builtin.git_branches()
			end)

			vim.keymap.set("n", ";gc", function()
				builtin.git_commits()
			end)

			vim.keymap.set("n", ";w", function()
				builtin.git_status()
			end)

			vim.keymap.set("n", "sf", function()
				telescope.extensions.file_browser.file_browser(picker_style({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = true,
					git_status = false,
					create_from_prompt = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "insert",
					hide_parent_dir = true,
					use_fd = true,
					-- select_buffer = true,
					-- hijack_netrw = true,
					-- collapse_dirs = true
					-- layout_config = { height = 40 },
				}))
			end)

			vim.keymap.set("n", ";;", function()
				telescope.extensions.harpoon.marks(harpoon_picker)
			end)
			-- vim.keymap.set("n", "<C-e>", function()
			-- 	telescope.extensions.harpoon.marks(harpoon_picker)
			-- end)

			vim.keymap.set("n", "<F1>", function()
				builtin.resume({ initial_mode = "normal" })
			end)

			vim.keymap.set("n", ";q", function()
				builtin.quickfix()
			end)

			vim.keymap.set("n", ";m", function()
				builtin.quickfixhistory()
			end)
		end,
	},
}
