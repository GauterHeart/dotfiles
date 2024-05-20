return {

	"nvim-tree/nvim-web-devicons",
	config = function()
		local status, icons = pcall(require, "nvim-web-devicons")
		if not status then
			return
		end

		icons.setup({
			override = {
				norg = {
					icon = "󰎛",
					name = "Neorg",
				},
				proto = {
					icon = "󱍢",
					name = "Protobuf",
				},
				http = {
					icon = "",
					name = "Http",
				},
				env = {
					icon = "󰏗",
					name = "Env",
				},
			},
			default = true,
		})
	end,
}
