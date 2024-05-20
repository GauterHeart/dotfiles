return {
	"coffebar/neovim-project",
	commit = "771ccd6d7969d19bd84489d1fbae2541c5b9b9c7",
	opts = {
		-- Project directories
		projects = {},
		-- Path to store history and sessions
		datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
		-- Load the most recent session on startup if not in the project directory
		last_session_on_startup = false,
		-- Dashboard mode prevent session autoload on startup
		dashboard_mode = false,

		-- Overwrite some of Session Manager options
		session_manager_opts = {
			autosave_ignore_dirs = {
				vim.fn.expand("~"), -- don't create a session for $HOME/
				"/tmp",
			},
			autosave_ignore_filetypes = {
				-- All buffers of these file types will be closed before the session is saved
				"ccc-ui",
				"gitcommit",
				"gitrebase",
				"qf",
				"toggleterm",
			},
		},
		vim.keymap.set("n", "<F10>", "<cmd>Telescope neovim-project discover theme=dropdown<CR>"),
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
