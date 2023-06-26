local status, tree = pcall(require, "neo-tree")
if not status then
	return
end

-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

tree.setup({
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		-- "document_symbols",
	},
	source_selector = {
		winbar = false, -- toggle to show selector on winbar
		statusline = false, -- toggle to show selector on statusline
		show_scrolled_off_parent_node = false, -- boolean
		sources = { -- table
			{
				source = "filesystem", -- string
				display_name = "filesystem", -- string | nil
			},
			{
				source = "buffers", -- string
				display_name = " Buffers ", -- string | nil
			},
			{
				source = "git_status", -- string
				display_name = "Git ", -- string | nil
			},
		},
		content_layout = "start", -- string
		tabs_layout = "equal", -- string
		truncation_character = "…", -- string
		tabs_min_width = nil, -- int | nil
		tabs_max_width = nil, -- int | nil
		padding = 0, -- int | { left: int, right: int }
		separator = { left = "▏", right = "▕" }, -- string | { left: string, right: string, override: string | nil }
		separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
		show_separator_on_edge = false, -- boolean
		highlight_tab = "NeoTreeTabInactive", -- string
		highlight_tab_active = "NeoTreeTabActive", -- string
		highlight_background = "NeoTreeTabInactive", -- string
		highlight_separator = "NeoTreeTabSeparatorInactive", -- string
		highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
	},
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	sort_case_insensitive = false, -- used when sorting files and directories in the tree
	sort_function = nil, -- use a custom function for sorting files and directories in the tree
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰉖",
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰑕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰽚",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		position = "left",
		width = 40,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = false,
			},
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["w"] = "open_with_window_picker",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["a"] = {
				"add",
				config = {
					show_path = "none", -- "none", "relative", "absolute"
				},
			},
			["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["<ESC>"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
		},
	},
	nesting_rules = {},
	filesystem = {
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true, -- only works on Windows for hidden files/directories
			hide_by_name = {
				--"node_modules"
			},
			hide_by_pattern = { -- uses glob style patterns
				"*.meta",
				"*/src/*/tsconfig.json",
				"*/venv/*",
				"*.null-ls_*",
			},
		},
		follow_current_file = false, -- This will find and focus the file in the active buffer every
		group_empty_dirs = false, -- when true, empty folders will be grouped together
		hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
			},
		},
	},
	buffers = {
		follow_current_file = true,
		group_empty_dirs = false,
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			},
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
		},
	},
})

vim.keymap.set("n", "se", "<cmd>NeoTreeFloat<cr>")
