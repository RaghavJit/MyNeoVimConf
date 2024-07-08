vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Resize window with Ctrl + arrow keys
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true })

-- Navigate buffers with Alt + [ and Alt + ]
vim.api.nvim_set_keymap('n', '<A-[>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-]>', ':bnext<CR>', { noremap = true, silent = true })

-- Move between windows with Alt + arrow keys
vim.api.nvim_set_keymap('n', '<A-Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>o', ':Neotree focus<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Custom function to toggle both ToggleTerm and Neotree
local function toggle_func()
    local has_toggleterm = false
    local has_neotree = false

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buf):match("toggleterm") then
            has_toggleterm = true
            break
        end
    end

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buf):match("neo") then
            has_neotree = true
            break
        end
    end

    if toggleterm_found then
        vim.cmd("ToggleTerm")
    else
        vim.cmd("ToggleTerm")
        if (has_neotree) then
            vim.cmd("Neotree toggle")
            vim.cmd("Neotree toggle")
        end
  end
end

vim.keymap.set("n", "<leader>t", toggle_func, {noremap=true})

-- Map Ctrl+w to close the current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true, silent = true })

-- Map Ctrl+Q to close all buffers
vim.api.nvim_set_keymap('n', '<C-Q>', ':bufdo bd<CR>', { noremap = true, silent = true })

