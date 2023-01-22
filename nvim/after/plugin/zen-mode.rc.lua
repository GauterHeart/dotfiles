local status, zen = pcall(require, "zen-mode")
if not status then
	return
end

zen.setup({
	window = {
		backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
		width = .75,
		height = .80, -- height of the Zen window
	},
	plugins = {
		-- disable some global vim options (vim.o...)
		-- comment the lines to not apply the options
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
		},
		twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = false }, -- disables git signs
		tmux = { enabled = false }, -- disables the tmux statusline
		-- this will change the font size on kitty when in zen mode
		-- to make this work, you need to set the following kitty options:
		-- - allow_remote_control socket-only
		-- - listen_on unix:/tmp/kitty
		kitty = {
			enabled = false,
			font = "+4", -- font size increment
		},
	},
	-- callback where you can add custom code when the Zen window opens
	on_open = function(win) end,
	-- callback where you can add custom code when the Zen window closes
	on_close = function() end,
})

vim.keymap.set("n", "zm", zen.toggle, { noremap = true })
