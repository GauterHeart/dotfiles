return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local status, toggleterm = pcall(require, "toggleterm")
			if not status then
				return
			end

			-- local highlights = require("rose-pine.plugins.toggleterm")
			-- require("toggleterm").setup({ highlights = highlights })

			toggleterm.setup({
				open_mapping = [[<F3>]],
				shade_terminals = true,
				direction = "float",
			})

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<F1>", [[<C-\><C-n>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
