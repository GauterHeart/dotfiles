return {

	"nvim-treesitter/nvim-treesitter-textobjects",

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
		config = function()
			local status, ts = pcall(require, "nvim-treesitter.configs")
			if not status then
				return
			end

			ts.setup({
				modules = {},
				auto_install = true,
				sync_install = false,
				ignore_install = {},
				-- highlight = {
				-- 	enable = true,
				-- 	additional_vim_regex_highlighting = true,
				-- 	use_languagetree = true,
				-- 	disable = {},
				-- },

				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					-- disable = { "python", "yaml" },
					-- disable = { "norg" },
				},
				ensure_installed = {
					"tsx",
					"toml",
					"json",
					"yaml",
					"css",
					"html",
					"lua",
					"python",
					"go",
					"dockerfile",
					"javascript",
					"markdown",
					"lua",
					"bash",
				},
				autotag = {
					enable = true,
				},
				-- context_commentstring = {
				-- 	enable = true,
				-- },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
							["]o"] = "@loop.*",
							["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
						goto_next = {
							["]d"] = "@conditional.outer",
						},
						goto_previous = {
							["[d"] = "@conditional.outer",
						},
					},
				},
			})

			-- require("nvim-treesitter.install").compilers = { "gcc-12" }
			vim.opt.conceallevel = 2 -- remove markdown and neorg syntax
		end,
	},
}
