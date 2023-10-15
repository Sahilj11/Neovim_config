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
-- Better window navigation
keymap("n","<leader>v", "<C-w>v", opts)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
--keymap("n", "<C-w>.", ":vertical resize -2<CR>", opts)
--keymap("n", "<C-w>,", ":vertical resize +2<CR>", opts)

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
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("n", "<leader>l", "$", opts)
keymap("n", "<leader>h", "^", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Saving and quiting
keymap("n" , "<leader>q",":q<CR>", opts)
keymap("n" , "<leader>w",":w<CR>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>",opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>",opts)
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>",opts)
keymap("n", "<leader>fi", ":Telescope lsp_implementations<CR>",opts)
keymap("n", "<leader>ft", ":Telescope treesitter<CR>",opts)
keymap("n", "<leader>fd", ":Telescope lsp_definitions<CR>",opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>",opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>",opts)
keymap("n", "<leader>fc", ":Telescope git_commits<CR>",opts)

