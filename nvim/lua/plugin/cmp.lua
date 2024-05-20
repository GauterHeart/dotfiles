return {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"saadparwaiz1/cmp_luasnip",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local status, cmp = pcall(require, "cmp")
			if not status then
				return
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						-- winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
					}),

					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-c>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-s>"] = cmp.mapping.complete({
						config = {
							sources = {
								{ name = "buffer", max_item_count = 10 },
							},
						},
					}),
					["<C-o>"] = cmp.mapping.complete({
						config = {
							sources = {
								{ name = "nvim_lsp" },
							},
						},
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", max_item_count = 5 },
					{ name = "luasnip", max_item_count = 5 },
				}),
				-- completion = {
				-- 	autocomplete = false,
				-- },
			})
		end,
	},
}
