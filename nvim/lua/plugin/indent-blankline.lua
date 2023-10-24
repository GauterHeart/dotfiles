return {
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
		-- indent = {
		-- 	char = "│",
		-- },
	},
}
