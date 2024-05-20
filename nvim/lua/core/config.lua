vim.cmd("autocmd!")

-- File
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- SPEED
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_go_provider = 0
vim.g.loaded_ruby_provider = 0

-- Off swap
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Mouse
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- statusline
vim.opt.laststatus = 3

-- Base
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showcmd = false
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.shell = "fish"
vim.o.timeoutlen = 400

vim.o.showtabline = 2
vim.opt.list = true
vim.opt.listchars = { eol = "↵" }
vim.cmd("set listchars+=tab:\\ \\ ")

-- Tab
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.breakindent = true
vim.opt.wildoptions = "fuzzy"

vim.opt.iskeyword = { "@", "48-57", "192-255" }

-- UI
vim.o.guifont = "Source Code Pro:h20"
-- vim.g.neovide_cursor_vfx_mode = "ripple"
-- vim.g.neovide_cursor_vfx_mode = "sonicboom"
-- vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_trail_size = 0

vim.g.neovide_input_use_logo = 1
vim.g.neovide_hide_mouse_when_typing = 1

vim.g.neovide_refresh_rate = 144
vim.g.neovide_input_macos_option_key_is_meta = true
