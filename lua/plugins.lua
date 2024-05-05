-- function lazy.install(path)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
-- end

-- function lazy.setup(plugins)
-- 	if vim.g.plugins_ready then
-- 		return
-- 	end
--
-- 	-- You can "comment out" the line below after lazy.nvim is installed
-- 	-- lazy.install(lazy.path)
--
-- 	vim.opt.rtp:prepend(lazy.path)
--
-- 	require("lazy").setup(plugins, lazy.opts)
-- 	vim.g.plugins_ready = true
-- end
vim.opt.rtp:prepend(lazypath)

--lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--lazy.opts = {}

require("lazy").setup({
    -- List of plugins
    { "nvim-treesitter/nvim-treesitter" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
    -- LSP
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "jay-babu/mason-nvim-dap.nvim" },

    -- null-ls
    { "nvimtools/none-ls.nvim" },
    { "jay-babu/mason-null-ls.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
    },
    { "rafamadriz/friendly-snippets" },

    -- java_lsp
    { "mfussenegger/nvim-jdtls",     dependencies = { "mfussenegger/nvim-dap" } },

    --file navigations
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    -- Git work flow
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    -- colorscheme
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                overrides = {
                    SignColumn = { link = "Normal" },
                    GruvboxGreenSign = { bg = "" },
                    GruvboxOrangeSign = { bg = "" },
                    GruvboxPurpleSign = { bg = "" },
                    GruvboxYellowSign = { bg = "" },
                    GruvboxRedSign = { bg = "" },
                    GruvboxBlueSign = { bg = "" },
                    GruvboxAquaSign = { bg = "" },
                },
            })
            -- add any options here
        end,
    },
    { "tanvirtin/monokai.nvim" },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "zootedb0t/citruszest.nvim",
        lazy = false,
        priority = 1000,
    },
    { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
    -- comments plugins
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    --file navigation
    { "ThePrimeagen/harpoon" },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    -- refactoring
    -- {
    --     "ThePrimeagen/refactoring.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     config = function()
    --         require("refactoring").setup()
    --     end,
    -- },
    -- diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            -- settings without a patched font or icons
            {
                icons = false,
                fold_open = "v", -- icon used for open folds
                fold_closed = ">", -- icon used for closed folds
                indent_lines = false, -- add an indent guide below the fold icons
                signs = {
                    -- icons / text used for a diagnostic
                    error = "error",
                    warning = "warn",
                    hint = "hint",
                    information = "info",
                },
                use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
            },
        },
    },
    -- other
    { "norcalli/nvim-colorizer.lua" },
    { "akinsho/toggleterm.nvim",    version = "*", config = true },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    --debugging
            -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
})
