local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local path_to_lombok = "/home/acerbic/.local/share/nvim/mason/packages/jdtls/lombok.jar"
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

        -- 💀
        "java", -- or '/usr/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "-javaagent:" .. path_to_lombok,
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        -- "-Dosgi.bundles.defaultStartLevel=4",
        -- "-Declipse.product=org.eclipse.jdt.ls.core.product",
        -- "-Dlog.protocol=true",
        -- "-Dlog.level=ALL",
        -- "-javaagent:" .. path_to_lombok,
        -- "-Xmx1g",
        -- "--add-modules=ALL-SYSTEM",
        -- "--add-opens",
        -- "java.base/java.util=ALL-UNNAMED",
        -- "--add-opens",
        -- "java.base/java.lang=ALL-UNNAMED",
        --
        -- 💀
        "-jar",
        "/home/acerbic/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar",
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        -- 💀
        "-configuration",
        "/home/acerbic/.local/share/nvim/mason/packages/jdtls/config_linux",
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.

        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        vim.fn.expand("/home/acerbic/.cache/jdtls-workspace") .. workspace_dir,
    },

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {},
        -- this is end initial
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {},
    },
    capabilities = capabilities,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
