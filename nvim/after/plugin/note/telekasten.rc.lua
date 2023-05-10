local status, telekasten = pcall(require, "telekasten")
if not status then
	return
end

telekasten.setup({
	home = vim.fn.expand("~/Heart/Notes"), -- Put the name of your notes directory here
	command_palette_theme = "dropdown",
})

-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", ";<Space>", "<cmd>Telekasten panel<CR>")

-- -- Most used functions
-- vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
-- vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
-- vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
-- vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
-- vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
-- vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
-- vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
-- vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
