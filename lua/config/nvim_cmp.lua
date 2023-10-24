require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup{
  ensure_installed = { "lua_ls", "rust_analyzer" },
}
local Capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Setup language servers.
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


require("lspconfig").lua_ls.setup{
    capabilities = Capabilities,
}
require("lspconfig").tsserver.setup{
    capabilities = Capabilities,
}
require("lspconfig").emmet_language_server.setup{
    capabilities = Capabilities,
}
require("lspconfig").pyright.setup{
    capabilities = Capabilities,
}
require("lspconfig").eslint.setup{}
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
require("lspconfig").html.setup{
  capabilities = capabilities,
}
require("lspconfig").clangd.setup{
    capabilities = Capabilities,
}
-- null-ls
local null_ls = require("null-ls")
null_ls.setup({
    -- you can reuse a shared lspconfig on_attach callback here
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.prettier,
    },
})
require("mason-null-ls").setup({
    ensure_installed = { "stylua", "jq" ,"eslint_d"}
})
