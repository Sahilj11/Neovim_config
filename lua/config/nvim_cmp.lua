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
