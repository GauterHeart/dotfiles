-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

require("core.config")
require("core.keymap")
lazy.setup("plugin")

require("core.code")


vim.keymap.set({ "n" }, "<C-l>", "<cmd>noh<CR>")



-- vim.g["diagnostics_active"] = true
-- function Toggle_diagnostics()
--     if vim.g.diagnostics_active then
--         vim.g.diagnostics_active = false
--         vim.diagnostic.disable()
--     else
--         vim.g.diagnostics_active = true
--         vim.diagnostic.enable()
--     end
-- end
--
-- vim.keymap.set('n', '<leader>dd', Toggle_diagnostics, { noremap = true, silent = true, desc = "Toggle vim diagnostics" })
