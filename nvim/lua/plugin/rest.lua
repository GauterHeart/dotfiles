return {
	"rest-nvim/rest.nvim",
	-- config = function()
	-- 	require("rest-nvim").setup({
	-- 		-- Open request results in a horizontal split
	-- 		result_split_horizontal = false,
	-- 		-- Keep the http file buffer above|left when split horizontal|vertical
	-- 		result_split_in_place = false,
	-- 		-- stay in current windows (.http file) or change to results window (default)
	-- 		stay_in_current_window_after_split = false,
	-- 		-- Skip SSL verification, useful for unknown certificates
	-- 		skip_ssl_verification = false,
	-- 		-- Encode URL before making request
	-- 		encode_url = true,
	-- 		-- Highlight request on run
	-- 		highlight = {
	-- 			enabled = true,
	-- 			timeout = 150,
	-- 		},
	-- 		result = {
	-- 			-- toggle showing URL, HTTP info, headers at top the of result window
	-- 			show_url = true,
	-- 			-- show the generated curl command in case you want to launch
	-- 			-- the same request via the terminal (can be verbose)
	-- 			show_curl_command = false,
	-- 			show_http_info = true,
	-- 			show_headers = true,
	-- 			-- table of curl `--write-out` variables or false if disabled
	-- 			-- for more granular control see Statistics Spec
	-- 			show_statistics = false,
	-- 			-- executables or functions for formatting response body [optional]
	-- 			-- set them to false if you want to disable them
	-- 			formatters = {
	-- 				json = "jq",
	-- 				html = function(body)
	-- 					return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
	-- 				end,
	-- 			},
	-- 		},
	-- 		-- Jump to request line on run
	-- 		jump_to_request = false,
	-- 		env_file = "http.env",
	-- 		custom_dynamic_variables = {},
	-- 		yank_dry_run = true,
	-- 		search_back = true,
	-- 	})
	-- 	vim.keymap.set("n", "zk", "<Plug>RestNvim")
	-- end,
	config = function()
		require("rest-nvim").setup({
			---@type table<string, fun():string> Table of custom dynamic variables
			custom_dynamic_variables = {},
			---@class rest.Config.Request
			request = {
				---@type boolean Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				---Default request hooks
				---@class rest.Config.Request.Hooks
				hooks = {
					---@type boolean Encode URL before making request
					encode_url = true,
					---@type string Set `User-Agent` header when it is empty
					user_agent = "rest.nvim v" .. require("rest-nvim.api").VERSION,
					---@type boolean Set `Content-Type` header when it is empty and body is provided
					set_content_type = true,
				},
			},
			---@class rest.Config.Response
			response = {
				---Default response hooks
				---@class rest.Config.Response.Hooks
				hooks = {
					---@type boolean Decode the request URL segments on response UI to improve readability
					decode_url = true,
					---@type boolean Format the response body using `gq` command
					format = true,
				},
			},
			---@class rest.Config.Clients
			clients = {
				---@class rest.Config.Clients.Curl
				curl = {
					---Statistics to be shown, takes cURL's `--write-out` flag variables
					---See `man curl` for `--write-out` flag
					---@type RestStatisticsStyle[]
					statistics = {
						{ id = "time_total", winbar = "take", title = "Time taken" },
						{ id = "size_download", winbar = "size", title = "Download size" },
					},
					---Curl-secific request/response hooks
					---@class rest.Config.Clients.Curl.Opts
					opts = {
						---@type boolean Add `--compressed` argument when `Accept-Encoding` header includes
						---`gzip`
						set_compressed = false,
					},
				},
			},
			---@class rest.Config.Cookies
			cookies = {
				---@type boolean Whether enable cookies support or not
				enable = true,
				---@type string Cookies file path
				path = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rest-nvim.cookies"),
			},
			---@class rest.Config.Env
			env = {
				---@type boolean
				enable = true,
				---@type string
				pattern = ".*%.env.*",
			},
			---@class rest.Config.UI
			ui = {
				---@type boolean Whether to set winbar to result panes
				winbar = true,
				---@class rest.Config.UI.Keybinds
				keybinds = {
					---@type string Mapping for cycle to previous result pane
					prev = "H",
					---@type string Mapping for cycle to next result pane
					next = "L",
				},
			},
			---@class rest.Config.Highlight
			highlight = {
				---@type boolean Whether current request highlighting is enabled or not
				enable = true,
				---@type number Duration time of the request highlighting in milliseconds
				timeout = 750,
			},
			---@see vim.log.levels
			---@type integer log level
			_log_level = vim.log.levels.WARN,
		})
	end,
}
