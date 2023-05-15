local status, lazy = pcall(require, "lazy")
if not status then
	print("Lazy is not installed")
	return
end

lazy.setup({
	defaults = {
		lazy = false, -- should plugins be lazy-loaded?
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
	"kkharji/sqlite.lua",

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

	-- Fzf
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"TC72/telescope-tele-tabby.nvim",
	"AckslD/nvim-neoclip.lua",
	{ "renerocksai/telekasten.nvim", commit = "67c5758a13352d6dcfdf9353283956c34ca06d3b" },

	-- Terminal
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- Git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",

	-- File explorer
	"nvim-neo-tree/neo-tree.nvim",

	-- Code
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
	},
	"windwp/nvim-autopairs",
	"lukas-reineke/indent-blankline.nvim",
	"numToStr/Comment.nvim",
	"nanozuki/tabby.nvim",

	-- Nvim
	"nvim-lualine/lualine.nvim",
	"phaazon/hop.nvim",
	"ThePrimeagen/harpoon",
	"rcarriga/nvim-notify",
	-- "folke/noice.nvim",

	-- Icons
	"nvim-tree/nvim-web-devicons",

	-- Theme
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{"rebelot/kanagawa.nvim", name = "kanagawa"},
	{ "EdenEast/nightfox.nvim", name = "nightfox" }
})
