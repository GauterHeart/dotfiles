return {
	{
		"onsails/lspkind-nvim",
		config = function()
			local status, lspkind = pcall(require, "lspkind")
			if not status then
				return
			end

			lspkind.init({
				-- DEPRECATED (use mode instead): enables text annotations
				--
				-- default: true
				-- with_text = true,

				-- defines how annotations are shown
				-- default: symbol
				-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
				mode = "symbol_text",

				-- default symbol map
				-- can be either 'default' (requires nerd-fonts font) or
				-- 'codicons' for codicon preset (requires vscode-codicons font)
				--
				-- default: 'default'
				preset = "codicons",

				-- override preset symbols
				--
				-- default: {}
				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
			})
		end,
	},
	{

		"nvim-lualine/lualine.nvim",
		config = function()
			local status, lualine = pcall(require, "lualine")
			if not status then
				return
			end

			lualine.setup({
				options = {
					icons_enabled = true,
					-- theme = "rose-pine",
					disabled_filetypes = {},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },

					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
	{
		"junegunn/fzf",
		{
			"kevinhwang91/nvim-bqf",
			config = function()
				vim.cmd([[
			hi BqfPreviewBorder guifg=#3e8e2d ctermfg=71
			hi BqfPreviewTitle guifg=#3e8e2d ctermfg=71
			hi BqfPreviewThumb guibg=#3e8e2d ctermbg=71
			hi link BqfPreviewRange Search
		]])

				require("bqf").setup({
					auto_enable = true,
					auto_resize_height = true, -- highly recommended enable
					preview = {
						win_height = 12,
						win_vheight = 12,
						delay_syntax = 80,
						border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
						show_title = false,
						should_preview_cb = function(bufnr, qwinid)
							local ret = true
							local bufname = vim.api.nvim_buf_get_name(bufnr)
							local fsize = vim.fn.getfsize(bufname)
							if fsize > 100 * 1024 then
								-- skip file size greater than 100k
								ret = false
							elseif bufname:match("^fugitive://") then
								-- skip fugitive buffer
								ret = false
							end
							return ret
						end,
					},
					-- make `drop` and `tab drop` to become preferred
					func_map = {
						drop = "o",
						openc = "O",
						split = "<C-s>",
						tabdrop = "<C-t>",
						-- set to empty string to disable
						tabc = "",
						ptogglemode = "z,",
					},
					filter = {
						fzf = {
							action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
							extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
						},
					},
				})
			end,
		},
	},
	{

		"nvim-tree/nvim-web-devicons",
		config = function()
			local status, icons = pcall(require, "nvim-web-devicons")
			if not status then
				return
			end

			icons.setup({
				override = {
					norg = {
						icon = "󰎛",
						name = "Neorg",
					},
					proto = {
						icon = "󱍢",
						name = "Protobuf",
					},
					http = {
						icon = "",
						name = "Http",
					},
					env = {
						icon = "󰏗",
						name = "Env",
					},
				},
				default = true,
			})
		end,
	},
	{
		{
			"nanozuki/tabby.nvim",

			config = function()
				local theme = {
					fill = "TabLineFill",
					-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
					head = "TabLine",
					current_tab = "TabLineSel",
					tab = "TabLine",
					win = "TabLine",
					tail = "TabLine",
				}
				require("tabby.tabline").set(function(line)
					return {
						buf_name = {
							mode = "shorten",
						},
						{
							{ "  ", hl = theme.head },
							line.sep(" ", theme.head, theme.fill),
						},
						line.tabs().foreach(function(tab)
							local hl = tab.is_current() and theme.current_tab or theme.tab
							return {
								line.sep("", hl, theme.fill),
								tab.is_current() and "" or "",
								tab.number(),
								tab.name(),
								line.sep("", hl, theme.fill),
								hl = hl,
								margin = " ",
							}
						end),
						line.spacer(),
						-- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
						-- 	return {
						-- 		line.sep(" ", theme.win, theme.fill),
						-- 		win.is_current() and "" or "",
						-- 		win.buf_name(),
						-- 		line.sep(" ", theme.win, theme.fill),
						-- 		hl = theme.win,
						-- 		margin = " ",
						-- 	}
						-- end),
						{
							line.sep(" ", theme.tail, theme.fill),
							-- { "  ", hl = theme.tail },
							{ " 󱐰 ", hl = theme.tail },
						},
						hl = theme.fill,
					}
				end)

				vim.keymap.set("n", "<Leader>tr", ":TabRename<Space>")
			end,
		},
	},
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
			indent = {
				char = "│",
			},
		},
	},
}
