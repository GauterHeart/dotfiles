return {
	"neovim/nvim-lspconfig",
	config = function()
		local status, nvim_lsp = pcall(require, "lspconfig")
		if not status then
			return
		end

		local util = require("lspconfig/util")
		-- vim.keymap.set("n", "cd", vim.diagnostic.open_float, { noremap = true, silent = true })

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		-- 	callback = function(ev)
		-- 		-- Enable completion triggered by <c-x><c-o>
		-- 		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		--
		-- 		-- Buffer local mappings.
		-- 		-- See `:help vim.lsp.*` for documentation on any of the below functions
		--
		-- 		local opts = { buffer = ev.buf }
		--
		-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- 		vim.keymap.set("n", "<leader>gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
		-- 		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- 		vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
		-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		-- 		vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
		-- 		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- 		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts)
		-- 		vim.keymap.set("n", "<leader>cf", function()
		-- 			vim.lsp.buf.format({ async = true })
		-- 		end, opts)
		-- 	end,
		-- })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "cd", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts)
				vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<leader>wl', function()
				  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)

				vim.keymap.set("n", "<leader>cf", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})

		local border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		}
		-- LSP settings (for overriding per client)
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}

		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

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
			-- signs = false,
			underline = true,
			update_in_insert = false,
			-- update_in_insert = true,
			severity_sort = true,
		})
		vim.o.updatetime = 0

		-- The main servers

		local root_files = {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			"pyrightconfig.json",
			".git",
		}

		nvim_lsp.pyright.setup({
			-- root_dir = util.root_pattern(unpack(root_files)),
			filetypes = { "python" },
			single_file_support = true,
			cmd = { "pyright-langserver", "--stdio" },
			handlers = handlers,
			-- handlers = {
			-- 	["textDocument/publishDiagnostics"] = function() end,
			-- },
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						-- diagnosticMode = "workspace",
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "on",
						-- typeCheckingMode = "off",
						-- reportUnusedVariable = "off",
					},
				},
			},
			capabilities = lsp_capabilities,
		})
		-- nvim_lsp.pylyzer.setup{}

		nvim_lsp.tsserver.setup({
			-- on_attach = on_attach,
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			handlers = handlers,
			cmd = { "typescript-language-server", "--stdio" },
			capabilities = vim.lsp.protocol.make_client_capabilities(),
			on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		-- nvim_lsp.gopls.setup({
		-- 	-- cmd = { "gopls", "serve" },
		-- 	filetypes = { "go", "gomod" },
		-- 	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		-- 	settings = {
		-- 		gopls = {
		-- 			analyses = {
		-- 				unusedparams = true,
		-- 			},
		-- 			staticcheck = true,
		-- 		},
		-- 	},
		-- })
		nvim_lsp.gopls.setup({

			handlers = handlers,
		})

		nvim_lsp.lua_ls.setup({
			handlers = handlers,
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
			capabilities = vim.lsp.protocol.make_client_capabilities(),
			on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil
			end,
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

		nvim_lsp.bufls.setup({})
	end,
}
