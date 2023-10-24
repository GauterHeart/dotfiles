return {
	"kelly-lin/ranger.nvim",
	config = function()
		require("ranger-nvim").setup({ replace_netrw = true })
		vim.api.nvim_set_keymap("n", "se", "", {
			noremap = true,
			callback = function()
				require("ranger-nvim").open(true)
			end,
		})
	end,
}
