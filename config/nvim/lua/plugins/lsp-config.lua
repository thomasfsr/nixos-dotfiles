return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			-- Go
			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})

			-- Python
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
						},
					},
				},
			})

			-- Nix
			vim.lsp.config("nil_ls", {
				capabilities = capabilities,
			})

			-- TypeScript / JavaScript
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("laravel_lsp", {
				cmd = { "laravel-lsp" },
				filetypes = { "php", "blade" },
				-- root_markers = { "artisan", "composer.json", ".git" },
				root_dir = function(bufnr, on_dir)
					local root = vim.fs.root(bufnr, "artisan")
					if root then
						on_dir(root)
					end
				end,
				capabilities = capabilities,
			})
			-- Ativar os servidores
			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"pyright",
				"nil_ls",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"bashls",
				"zls",
				"intelephense",
				"laravel_lsp",
			})

			-- Diagnósticos
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
				},
			})

			-- Atalhos
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float(nil, {
					border = "rounded",
				})
			end, { desc = "Show diagnostics under cursor" })

			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
			vim.keymap.set("n", "<leader><Enter>", vim.lsp.buf.references)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
