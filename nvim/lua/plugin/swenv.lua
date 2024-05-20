return {
	"AckslD/swenv.nvim",
	commit = "c11eeaa6f8f05abdcbb0a53d0ac290e3f9fabd2c",
	config = function()
		require("swenv").setup({
			-- Should return a list of tables with a `name` and a `path` entry each.
			-- Gets the argument `venvs_path` set below.
			-- By default just lists the entries in `venvs_path`.
			get_venvs = function(venvs_path)
				return require("swenv.api").get_venvs(venvs_path)
			end,
			-- Path passed to `get_venvs`.
			venvs_path = vim.fn.expand("~/.venv"),
			-- Something to do after setting an environment, for example call vim.cmd.LspRestart
			-- post_set_venv = nil,
			post_set_venv = function()
				vim.cmd([[:LspRestart]])
			end,
		})

		vim.keymap.set("n", "<leader>vv", "<cmd>lua require('swenv.api').pick_venv()<cr>")
	end,
}
