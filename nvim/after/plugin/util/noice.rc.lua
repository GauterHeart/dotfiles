local status, noice = pcall(require, "noice")
if not status then
	return
end

noice.setup({
	-- lsp = {
	-- 	progress = {
	-- 		enabled = false,
	-- 	},
	--    hover = {
	--      enabled = false,
	--      view = nil, -- when nil, use defaults from documentation
	--      ---@type NoiceViewOptions
	--      opts = {}, -- merged with defaults from documentation
	--    },
	-- },
	lsp = {
		progress = {
			enabled = false,
		},
		signature = {
			enabled = true,
			auto_open = {
				enabled = false,
				trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
				luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
				throttle = 50, -- Debounce lsp signature help request by 50ms
			},
			view = nil, -- when nil, use defaults from documentation
			---@type NoiceViewOptions
			opts = {}, -- merged with defaults from documentation
		},
		message = {
			-- Messages shown by lsp servers
			enabled = true,
			view = "notify",
			opts = {},
		},
		-- defaults for hover and signature help
		documentation = {
			view = "hover",
			---@type NoiceViewOptions
			opts = {
				lang = "markdown",
				replace = true,
				render = "plain",
				format = { "{message}" },
				win_options = { concealcursor = "n", conceallevel = 3 },
			},
		},
	},
	message = {
		enabled = false,
		view = "notify",
		opts = {},
	},
	notify = {
		enabled = false,
		view = "notify",
	},
	messages = {
		enabled = true, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = false, -- view for errors
		view_warn = false, -- view for warnings
		view_history = false, -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = false, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
