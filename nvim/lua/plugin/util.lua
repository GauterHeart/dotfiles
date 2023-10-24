return {
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"rcarriga/nvim-notify",

	{
		"windwp/nvim-autopairs",
		config = function()
			local status_4, autopairs = pcall(require, "nvim-autopairs")
			if not status_4 then
				return
			end

			autopairs.setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
}
