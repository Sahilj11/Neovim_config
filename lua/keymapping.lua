local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal -
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-s>", "<C-u>zz", opts)

-- Better window navigation
-- keymap("n", "<leader>v", "<C-w>v", opts)
-- keymap("n", "<leader>b", "<C-w>s", opts)
-- keymap("n", "<leader>h", "<C-w>h", opts)
-- keymap("n", "<leader>j", "<C-w>j", opts)
-- keymap("n", "<leader>k", "<C-w>k", opts)
-- keymap("n", "<leader>l", "<C-w>l", opts)
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- stylua: ignore start
-- copying in clipboard
-- keymap('n', '<leader>yy', '"+yy', opts)
keymap('v', '<leader>yy', '"+y', opts)
keymap('v', '<leader>yp', '"+p', opts)
-- keymap('n', '<leader>yp', '"+P', opts)
-- stylua: ignore end
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -3<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text
keymap("n", "J", ":m .+1<CR>==", opts)
keymap("n", "K", ":m .-2<CR>==", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("v", "<leader>d", "$", opts)
-- keymap("n", "<leader>d", "$", opts)
keymap("v", "<leader>a", "^", opts)
-- keymap("n", "<leader>a", "^", opts)

-- Saving and quiting
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader>x", ":bd<CR>", opts)
keymap("v", "<leader>x", ":bd<CR>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope harpoon marks<CR>", opts)
keymap("n", "<leader>fw", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- formatting
keymap("n", "<leader>i", ":lua vim.lsp.buf.format()<CR>", opts)

-- git
keymap("n", "gf", ":0G<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<C-]>", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<C-[>", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)

-- colors
keymap("n", "<leader>tc", ":HighlightColors Toggle<CR>", opts)

--debugging
keymap("n", "<leader>gb", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>gc", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>gq", ":lua require'dapui'.close()<CR>",opts)

-- terminal
keymap("t", "<C-t>", "<C-\\><C-n>", opts)

-- harpoons
keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>p", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

-- neogen
keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
keymap("n", "<Leader>nc", ":lua require('neogen').generate({type='class'})<CR>", opts)

-- LSP
--Keymapping for lsp
vim.keymap.set("n", "<C-i>", vim.diagnostic.open_float)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<S-d>", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end,
})

function get_spring_boot_runner(profile, debug)
    local debug_param = ""
    if debug then
        debug_param =
        ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
    end

    local profile_param = ""
    if profile then
        profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
    end

    return "mvn spring-boot:run " .. profile_param .. debug_param
end

function run_spring_boot(debug)
    vim.cmd("term " .. get_spring_boot_runner(method_name, debug))
end

vim.keymap.set("n", "<leader>rs", function()
    run_spring_boot()
end, opts)
vim.keymap.set("n", "<leader>Rs", function()
    run_spring_boot(true)
end, opts)

function attach_to_debug()
    local dap = require("dap")
    dap.configurations.java = {
        {
            type = "java",
            request = "attach",
            name = "Attach to the process",
            hostName = "localhost",
            port = "5005",
        },
    }
    dap.continue()
end

keymap("n", "<leader>rd", ":lua attach_to_debug()<CR>", opts)
