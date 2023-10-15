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
-- Setup language servers.
require("lspconfig").lua_ls.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").emmet_language_server.setup{}
require("lspconfig").eslint.setup{}
require("lspconfig").pyright.setup{}

-- null-ls
local null_ls = require("null-ls")
null_ls.setup({
    -- you can reuse a shared lspconfig on_attach callback here
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.prettier,
    },
})
require("mason-null-ls").setup({
    ensure_installed = { "stylua", "jq" }
})
