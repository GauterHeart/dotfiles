local status, lazy = pcall(require, "lazy")
if not status then
	print("Lazy is not installed")
	return
end

lazy.setup({
	defaults = {
		lazy = true, -- should plugins be lazy-loaded?
	},
	performance = {
		cache = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/lazy/cache",
			disable_events = { "UIEnter", "BufReadPre" },
			ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {},
		},
	},
	-- Depends
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",

	-- Lsp
	"neovim/nvim-lspconfig", -- Lsp Engine
	"onsails/lspkind-nvim", -- vscode-like pictograms
	"jose-elias-alvarez/null-ls.nvim", -- Linter, Diagnostic ...
	"L3MON4D3/LuaSnip", -- Snippet Engine

	-- Lsp installer
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Completion
	"hrsh7th/nvim-cmp", -- Capabilities Engine
	"lukas-reineke/cmp-under-comparator",
	"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
	"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-- Fzf
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	"TC72/telescope-tele-tabby.nvim",

	-- Terminal
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- File browser

	-- Git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"sindrets/diffview.nvim",

	-- Code
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
	"windwp/nvim-autopairs",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = {
				show_start = false,
				include = {
					node_type = { "*" },
				},
				enabled = false,
			},
			-- indent = {
			-- 	char = "│",
			-- },
		},
	},
	"numToStr/Comment.nvim",
	"nanozuki/tabby.nvim",

	-- Nvim
	"nvim-lualine/lualine.nvim",
	"phaazon/hop.nvim",
	"ThePrimeagen/harpoon",
	"rcarriga/nvim-notify",

	-- Icons
	"nvim-tree/nvim-web-devicons",

	-- Theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Note
	{ "renerocksai/telekasten.nvim" },
})
