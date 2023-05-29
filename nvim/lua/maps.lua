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
-- Move window
keymap.set("n", "s<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Tab
keymap.set("n", "tt", "<cmd>tabnew<CR>")
keymap.set("n", "ts", "<cmd>tab split<CR>")
keymap.set("n", "tn", "<cmd>tabnext<CR>")
keymap.set("n", "tb", "<cmd>tabprev<CR>")

-- Buffer
keymap.set("n", "qq", "<cmd>close<CR>")

-- neovide
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

keymap.set("", "q", "<Nop>")
keymap.set("", "s", "<Nop>")
-- keymap.set("", "\'", "<Nop>")
-- keymap.set("", "<C-m>", "<Nop>")
-- keymap.set("", "<C-n>", "<Nop>")

-- Move
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<F1>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-m>", ";", { noremap = true, silent = true })

-- Buffer
-- keymap.set("n", "<C-i>", "<cmd>bnext<CR>")
-- keymap.set("n", "<C-o>", "<cmd>bprevious<CR>")
