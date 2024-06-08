local wk = require("which-key")

wk.register({
    g = {
        name = "git",
        b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
        t = {"<cmd>Gitsigns stage_buffer<cr>", "Stage buffer"},
        r = {
            name = "Reset",
            b = {"<cmd>Gitsigns reset_buffer<cr>", "Reset buffer"},
            h = {"<cmd>Gitsigns reset_hunk<cr>", "Reset hunk"}
        },
        p={ "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk"},
        s={ "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk"},
        d={ "<cmd>Gitsigns diffthis<cr>", "Get Diff"}
    },
    y={
        name = "Clipboard actions",
        y={'"+yy',"Copy whole line" },
        p={ '"+P',"Past from Clipboard"},
    },
    v = { "<C-w>v", "Vertical split"},
    b = { "<C-w>s", "Horizontal split" },
    h = { "<C-w>h", "Jump left pane" },
    j = { "<C-w>j", "Jump down pane" },
    k = { "<C-w>k", "Jump up pane" },
    l = { "<C-w>l", "Jump right pane" },
    e={":NvimTreeToggle<cr>", "Open Explorer"},
    d={ "$", "Go to end of line"},
    a={ "^", "Go to start of line"}
}, { prefix = "<leader>" })


-- Key mapping to call the function
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>FzfLua files<CR>', { noremap = true, silent = true })

