return {
	"williamboman/mason-lspconfig.nvim",
	{
		"williamboman/mason.nvim",
		config = function()
			local status, mason = pcall(require, "mason")
			if not status then
				return
			end

			local status2, lspconfig = pcall(require, "mason-lspconfig")

			if not status2 then
				return
			end

			mason.setup({})

			-- "sumneko_lua",
			lspconfig.setup({
				ensure_installed = { "bashls", "jsonls" },
			})
		end,
	},
}
