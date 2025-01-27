return {
	"GauterHeart/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	commit = "595301871f4d308fcda835f63fc5cd1f26aabe5b",
	config = function()
		require("telekasten").setup({
			home = vim.fn.expand(""), -- Put the name of your notes directory here
			extension = ".sql",
			auto_set_filetype = false,
			auto_set_syntax = false,
			tag_notation = "yaml-bare",
			show_tags_theme = "top"
		})
		vim.keymap.set("n", ";t", "<cmd>Telekasten show_tags<CR>")
	end,
}
