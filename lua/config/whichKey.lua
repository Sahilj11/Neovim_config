local wk = require("which-key")

wk.register({
    g = {
        name = "git",
        l = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
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

