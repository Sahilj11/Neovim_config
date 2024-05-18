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

vim.opt.rtp:prepend(lazypath)

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
    { "neovim/nvim-lspconfig"},
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
    { "lewis6991/gitsigns.nvim" },
    -- colorscheme
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     config = function()
    --         require("gruvbox").setup({
    --             overrides = {
    --                 SignColumn = { link = "Normal" },
    --                 GruvboxGreenSign = { bg = "" },
    --                 GruvboxOrangeSign = { bg = "" },
    --                 GruvboxPurpleSign = { bg = "" },
    --                 GruvboxYellowSign = { bg = "" },
    --                 GruvboxRedSign = { bg = "" },
    --                 GruvboxBlueSign = { bg = "" },
    --                 GruvboxAquaSign = { bg = "" },
    --             },
    --         })
    --         -- add any options here
    --     end,
    -- },
    -- { "overcache/NeoSolarized" },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
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
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    {
        "danymat/neogen",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    },
})
