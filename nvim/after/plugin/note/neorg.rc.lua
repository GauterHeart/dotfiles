local status, neorg = pcall(require, "neorg")
if not status then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		-- ["core.integrations.telescope"] = {},
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					work = "~/Heart/Notes/work",
					home = "~/Heart/Notes/home",
				},
			},
		},
	},
})
