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
    },
    { "rafamadriz/friendly-snippets" },
    -- { "honza/vim-snippets" },
    -- java_lsp
    { "mfussenegger/nvim-jdtls" },
    --file navigations
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Git work flow
    { "tpope/vim-fugitive" },
    {"lewis6991/gitsigns.nvim"},
    -- colorscheme
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
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
    -- comments plugins
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    --file navigation
    { "ThePrimeagen/harpoon" },
    -- luaLine
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    },
    { "norcalli/nvim-colorizer.lua" },
})
