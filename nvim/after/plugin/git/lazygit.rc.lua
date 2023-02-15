local status, lazygit = pcall(require, "lazygit")
if not status then
	return
end

vim.keymap.set("n", "<F1>", "<cmd>LazyGit<CR>")
vim.keymap.set("n", "<Leader>cb", ":Git checkout -b<Space>")
