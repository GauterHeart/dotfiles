return {

	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<Leader>cb", ":Git checkout -b<Space>")
		end,
	},
	{ "sindrets/diffview.nvim" },
	-- { "akinsho/git-conflict.nvim", version = "*", config = true },

	{
		"lewis6991/gitsigns.nvim",

		config = function()
			local status, git = pcall(require, "gitsigns")
			if not status then
				return
			end

			git.setup({
				signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
				numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					interval = 0,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = {
					enable = false,
				},
			})

			vim.keymap.set("n", "rl", ":Gitsigns blame_line<CR>")
			vim.keymap.set("n", "rn", ":Gitsigns next_hunk<CR>")
			vim.keymap.set("n", "rb", ":Gitsigns prev_hunk<CR>")
			vim.keymap.set("n", "rp", ":Gitsigns preview_hunk_inline<CR>")
			vim.keymap.set("n", "rd", ":Gitsigns diffthis<CR>")
			vim.keymap.set("n", "ra", ":Gitsigns stage_hunk<CR>")
			vim.keymap.set("n", "rab", ":Gitsigns stage_buffer<CR>")
			vim.keymap.set("n", "rq", ":Gitsigns reset_hunk<CR>")
			vim.keymap.set("n", "rqa", ":Gitsigns reset_buffer<CR>")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<F5>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
		config = function()
			vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
			vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
			vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
			vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
			vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

			vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
			vim.g.lazygit_config_file_path = "" -- custom config file path
			-- OR
			vim.g.lazygit_config_file_path = {} -- table of custom config file paths
		end,
	},
}
