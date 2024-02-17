local api = vim.api
api.nvim_command("autocmd TermOpen * startinsert")                        -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber") -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")

local term_open = false

function open_terminal_split()
    -- Iterate through each buffer
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        -- Check if the buffer is a terminal
        if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            -- Open a split and switch to it
            vim.cmd("split")
            vim.cmd("buffer " .. buf)
            return
        end
    end
    -- If no terminal buffer found, print a message
    print("No terminal buffer found")
end

function termCheck()
    if term_open and vim.api.nvim_buf_get_option(0, 'buftype') ~= 'terminal' then
        vim.cmd("resize -3")
        open_terminal_split()
    elseif term_open == false then
        vim.cmd("split")
        vim.cmd("resize -3")
        vim.cmd("terminal")
        term_open = true
    elseif term_open and vim.api.nvim_buf_get_option(0, 'buftype') == 'terminal' then
        vim.cmd("q")
    end
end

vim.api.nvim_set_keymap("n", "<space>t", "<cmd>lua termCheck()<CR>", { noremap = true, silent = true })
