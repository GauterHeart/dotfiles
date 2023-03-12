-- vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local util = require("lspconfig/util")
local navic = require("nvim-navic")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "cd", vim.diagnostic.open_float, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	navic.attach(client, bufnr)

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>cf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- Diagnostic
local signs = {
	Error = "",
	Warning = "",
	Hint = "",
	Information = "",
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
	on_attach = on_attach,
	-- 	capabilities = capabilities,
	filetypes = { "python" },
	single_file_support = true,
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
				reportUnusedVariable = "warning",
			},
		},
	},
})

nvim_lsp.pylsp.setup({
	-- on_attach = on_attach,
	-- 	capabilities = capabilities,
	filetypes = { "python" },
	single_file_support = true,
	cmd = { "pylsp" },
	settings = {
		pylsp = {
			plugins = {
				-- jedi_environment = "venv",
				jedi_completion = { enabled = false },
				jedi_hover = { enabled = false },
				jedi_references = { enabled = false },
				jedi_signature_help = { enabled = false },
				jedi_symbols = { enabled = false, all_scopes = false },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				flake8 = { enabled = true },
				mypy = { enabled = true },
			},
		},
	},
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
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
