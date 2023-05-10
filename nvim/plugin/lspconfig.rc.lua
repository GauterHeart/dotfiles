-- vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local util = require("lspconfig/util")
vim.keymap.set("n", "cd", vim.diagnostic.open_float, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions

		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>cf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Diagnostic
local signs = {
	Error = "",
	Warn = "󰥲",
	Hint = "",
	Info = "",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
vim.o.updatetime = 0

-- The main servers

nvim_lsp.pyright.setup({
	-- on_attach = on_attach,
	-- 	capabilities = capabilities,
	filetypes = { "python" },
	single_file_support = true,
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				-- diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "on",
				reportUnusedVariable = "off",
			},
		},
	},
})

-- nvim_lsp.ruff_lsp.setup({
-- 	on_attach = on_attach,
-- 	filetypes = { "python" },
-- 	single_file_support = true,
-- 	cmd = { "ruff-lsp" },
-- 	init_options = {
-- 		settings = {
-- 			args = {},
-- 		},
-- 	},
-- })

-- nvim_lsp.pylsp.setup({
-- 	-- on_attach = on_attach,
-- 	-- 	capabilities = capabilities,
-- 	filetypes = { "python" },
-- 	single_file_support = true,
-- 	cmd = { "pylsp" },
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				-- jedi_environment = "venv",
-- 				jedi_completion = { enabled = false },
-- 				jedi_hover = { enabled = false },
-- 				jedi_references = { enabled = false },
-- 				jedi_signature_help = { enabled = false },
-- 				jedi_symbols = { enabled = false, all_scopes = false },
-- 				pycodestyle = { enabled = false },
-- 				pyflakes = { enabled = false },
-- 				flake8 = { enabled = true },
-- 				-- mypy = { enabled = true },
-- 				pylint = {enabled = false}
-- 			},
-- 		},
-- 	},
-- })

nvim_lsp.tsserver.setup({
	-- on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},

			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

-- Utils LSP
nvim_lsp.bashls.setup({})
nvim_lsp.jsonls.setup({})
nvim_lsp.marksman.setup({
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
	single_file_support = true,
	root_dir = util.root_pattern(".git", ".marksman.toml"),
})
