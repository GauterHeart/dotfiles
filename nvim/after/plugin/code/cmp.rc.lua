local status, cmp = pcall(require, "cmp")
if not status then
	return
end
if not cmp then
	return
end

local lspkind = require("lspkind")

-- vim.o.completeopt = "menu,menuone,noselect"

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

cmp.setup({
	experimental = { ghost_text = true },
	window = {
		completion = {
			border = "rounded",
			winhighlight = "NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder",
			-- border = border("CmpBorder"),
			-- winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
			-- winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
			scrollbar = false,
		},
		documentation = {
			border = border("CmpDocBorder"),
			-- winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
		-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
		["<C-c>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-s>"] = cmp.mapping.complete({
			config = {
				sources = {
					{ name = "buffer", max_item_count = 5 },
				},
			},
		}),
	}),
	sources = cmp.config.sources({
		-- { name = "nvim_lsp", max_item_count = 5, group_index = 1 },
		-- { name = "luasnip", max_item_count = 5, group_index = 1 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "luasnip", group_index = 1 },
		-- { name = "buffer", max_item_count = 5, group_index = 2 },
	}),
	formatting = {
		format = lspkind.cmp_format({ with_text = false, maxwidth = 25 }),
	},
	completion = {
		-- autocomplete = false,
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- `/` cmdline setup.
-- cmp.setup.cmdline("/", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })

vim.opt.pumheight = 5
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd({ "CmdlineLeave", "VimEnter" }, {
-- 	callback = function()
-- 		vim.opt.pumheight = 5
-- 	end,
-- })
-- autocmd("CmdlineEnter", {
-- 	callback = function()
-- 		vim.opt.pumheight = 5
-- 	end,
-- })
