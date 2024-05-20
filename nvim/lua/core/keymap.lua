local keymap = vim.keymap

-- Delete without clipboard
keymap.set("n", "dw", 'vb"_d')
keymap.set("n", "D", '"_D')
keymap.set("v", "d", '"_d')
keymap.set("n", "dd", '"_dd')

-- Cut and write without clipboard
keymap.set("n", "C", '"_C')
keymap.set("n", "cc", '"_cc')
keymap.set("n", "ce", '"_ce')
keymap.set("n", "cb", '"_cb')
keymap.set("n", "c", '"_c')
keymap.set("v", "c", '"_c')

keymap.set("n", "x", '"_ca')

-- Paste and write without clipboard
-- keymap.set("n", "p", '"0p')
-- keymap.set("n", "P", '"0P')
-- keymap.set("v", "p", '"0p')
-- keymap.set("v", "p", '"_xp')

-- Split window
keymap.set("n", "ss", "<cmd>split<Return><C-w>w")
keymap.set("n", "sv", "<cmd>vsplit<Return><C-w>w")

-- Tab
keymap.set("n", "tt", "<cmd>tabnew<CR>")
keymap.set("n", "ts", "<cmd>tab split<CR>")
keymap.set("n", "tn", "<cmd>tabnext<CR>")
keymap.set("n", "tb", "<cmd>tabprev<CR>")
keymap.set("", "<BS>", "<Nop>")
keymap.set("n", "<BS>k", "<cmd>tabnext<CR>")
keymap.set("n", "<BS>j", "<cmd>tabprev<CR>")

keymap.set("n", "t1", "<cmd>tabn 1<CR>")
keymap.set("n", "t2", "<cmd>tabn 2<CR>")
keymap.set("n", "t3", "<cmd>tabn 3<CR>")
keymap.set("n", "t4", "<cmd>tabn 4<CR>")
keymap.set("n", "t5", "<cmd>tabn 5<CR>")
keymap.set("n", "t6", "<cmd>tabn 6<CR>")
keymap.set("n", "t7", "<cmd>tabn 7<CR>")
keymap.set("n", "t8", "<cmd>tabn 8<CR>")
keymap.set("n", "t9", "<cmd>tabn 9<CR>")

-- Buffer
keymap.set("n", "qq", "<cmd>close<CR>")

-- neovide
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

keymap.set("", "q", "<Nop>")
keymap.set("", "s", "<Nop>")
keymap.set("", "r", "<Nop>")
keymap.set("i", "<F1>", "<Nop>")
keymap.set("i", "<F2>", "<Nop>")
keymap.set("i", "<F3>", "<Nop>")
keymap.set("i", "<F4>", "<Nop>")
keymap.set("i", "<F5>", "<Nop>")
keymap.set("i", "<F6>", "<Nop>")
keymap.set("i", "<F7>", "<Nop>")
keymap.set("i", "<F8>", "<Nop>")
keymap.set("i", "<F9>", "<Nop>")
keymap.set("i", "<F10>", "<Nop>")
keymap.set("i", "<F11>", "<Nop>")
keymap.set("i", "<F12>", "<Nop>")
keymap.set("i", "<F13>", "<Nop>")
keymap.set("i", "<F14>", "<Nop>")
keymap.set("i", "<F15>", "<Nop>")
keymap.set("i", "<F16>", "<Nop>")
keymap.set("i", "<F17>", "<Nop>")
keymap.set("i", "<F18>", "<Nop>")
keymap.set("i", "<F19>", "<Nop>")
keymap.set("i", "<F20>", "<Nop>")
keymap.set("i", "<F21>", "<Nop>")
keymap.set("i", "<F22>", "<Nop>")
keymap.set("i", "<F23>", "<Nop>")
keymap.set("i", "<F24>", "<Nop>")
-- keymap.set("", "\'", "<Nop>")
-- keymap.set("", "<C-m>", "<Nop>")
-- keymap.set("", "<C-n>", "<Nop>")

-- Move
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<F1>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>,", ";", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<C-i>", ";", { noremap = true, silent = true })

-- LSP
keymap.set("n", "<leader>rl", "<cmd>lua vim.diagnostic.reset()<CR>")

if vim.g.neovide then
	keymap.set("n", "<F9>1", "<cmd>tabn 1<CR>")
	keymap.set("n", "<F9>2", "<cmd>tabn 2<CR>")
	keymap.set("n", "<F9>3", "<cmd>tabn 3<CR>")
	keymap.set("n", "<F9>4", "<cmd>tabn 4<CR>")
	keymap.set("n", "<F9>5", "<cmd>tabn 5<CR>")
	keymap.set("n", "<F9>6", "<cmd>tabn 6<CR>")
	keymap.set("n", "<F9>7", "<cmd>tabn 7<CR>")
	keymap.set("n", "<F9>8", "<cmd>tabn 8<CR>")
	keymap.set("n", "<F9>9", "<cmd>tabn 9<CR>")

	keymap.set("n", "<F9>n", "<cmd>tabnext<CR>")
	keymap.set("n", "<F9>b", "<cmd>tabprev<CR>")
	keymap.set("n", "<F9>k", "<cmd>tabnext<CR>")
	keymap.set("n", "<F9>j", "<cmd>tabprev<CR>")
end
