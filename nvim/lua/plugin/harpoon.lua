return {

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

	-- config = function()
	-- 	local status, harpoon = pcall(require, "harpoon")
	-- 	if not status then
	-- 		return
	-- 	end
	--
	-- 	harpoon.setup({
	-- 		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
	-- 		save_on_toggle = false,
	--
	-- 		-- saves the harpoon file upon every change. disabling is unrecommended.
	-- 		save_on_change = true,
	--
	-- 		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	-- 		enter_on_sendcmd = false,
	--
	-- 		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	-- 		tmux_autoclose_windows = false,
	--
	-- 		-- filetypes that you want to prevent from adding to the harpoon list menu.
	-- 		excluded_filetypes = { "harpoon" },
	--
	-- 		-- set marks specific to each git branch inside git repository
	-- 		mark_branch = false,
	-- 	})
	--
	-- 	vim.api.nvim_set_keymap(
	-- 		"n",
	-- 		"<F7>",
	-- 		"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
	-- 		{ noremap = true, silent = true }
	-- 	)
	--
	-- 	vim.api.nvim_set_keymap(
	-- 		"n",
	-- 		"<leader>af",
	-- 		"<cmd>lua require('harpoon.mark').add_file()<cr>",
	-- 		{ noremap = true, silent = true }
	-- 	)
	-- 	vim.keymap.set("n", "<leader>g", function() harpoon:list():append() end)
	-- 	vim.keymap.set("n", "<leader>n", function() harpoon:list():select(1) end)
	--
	-- end,
}
