require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer" },
})
local Capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Setup language servers.
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").lua_ls.setup({
	capabilities = Capabilities,
})
require("lspconfig").tsserver.setup({
	capabilities = Capabilities,
})
require("lspconfig").emmet_language_server.setup({
	capabilities = Capabilities,
})
require("lspconfig").pyright.setup({
	capabilities = Capabilities,
})
require("lspconfig").eslint.setup({})
require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
require("lspconfig").html.setup({
	capabilities = capabilities,
})
require("lspconfig").clangd.setup({
	capabilities = Capabilities,
})
-- null-ls
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	-- function to format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
	-- you can reuse a shared lspconfig on_attach callback here
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.prettier,
	},
})
require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "eslint_d", "prettier" },
})
