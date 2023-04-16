local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local sources = {
	-- null_ls.builtins.diagnostics.flake8.with({
	-- 	prefer_local = "venv/bin",
	-- 	filetypes = { "python" },
	-- 	args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-" },
	-- 	diagnostics_format = "[flake8] #{m}\n(#{c})",
	-- }),
	-- null_ls.builtins.diagnostics.mypy.with({
	-- 	prefer_local = "venv/bin",
	-- 	filetypes = { "python" },
	-- 	diagnostics_format = "[mypy] #{m}\n(#{c})",
	-- 	method = null_ls.methods.DIAGNOSTICS,
	-- }),
	-- null_ls.builtins.diagnostics.pylint.with({
	--   diagnostics_postprocess = function(diagnostic)
	--     diagnostic.code = diagnostic.message_id
	--   end,
	-- }),
	-- null_ls.builtins.diagnostics.zsh,
	-- null_ls.builtins.formatting.isort,
	-- null_ls.builtins.formatting.autoflake,
	null_ls.builtins.diagnostics.mypy.with({
		args = function(params)
			return {
				"--hide-error-context",
				"--no-color-output",
				"--show-absolute-path",
				"--show-column-numbers",
				"--show-error-codes",
				"--no-error-summary",
				"--no-pretty",
				"--shadow-file",
				params.bufname,
				params.temp_path,
				params.bufname,
			}
		end,
		prefer_local = ".venv/bin",
		timeout = 100000,
		filetypes = { "python" },
		diagnostics_format = "[mypy] #{m}",
		method = null_ls.methods.DIAGNOSTICS,
		runtime_condition = function(params)
			if string.find(params.bufname, "fugitive") or string.find(params.bufname, ".venv") then
				return false
			else
				return true
			end
		end,
	}),
}

null_ls.setup({
	sources = sources,
})
