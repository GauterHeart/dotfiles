local status, hop = pcall(require, "hop")
if not status then
	return
end

hop.setup({})

-- vim.keymap.set("", "<Space>", function()
-- 	hop.hint_char1({ current_line_only = true })
-- end, { remap = true })

vim.keymap.set("", "<Space>", function()
	hop.hint_words()
end, { remap = true })
