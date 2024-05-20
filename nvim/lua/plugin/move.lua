return {
	{

		"smoka7/hop.nvim",
		config = function()
			local status, hop = pcall(require, "hop")
			if not status then
				return
			end

			hop.setup({})

			vim.keymap.set("", "<Space>", function()
				hop.hint_words()
			end, { remap = true })

			vim.keymap.set("", "f", function()
				hop.hint_char1({ current_line_only = true })
			end, { remap = true })

			vim.keymap.set("", "<leader><Space>", function()
				hop.hint_patterns()
			end, { remap = true })
		end,
	},
	{

		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-t>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-s>", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
			vim.keymap.set("n", "<C-P>", function()
				harpoon:list():prev()
			end)
			-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
			vim.keymap.set("n", "<C-N>", function()
				harpoon:list():next()
			end)
		end,
	},
}
