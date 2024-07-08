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

-- Map Ctrl+w to close the current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true, silent = true })

-- Map Ctrl+Q to close all buffers
vim.api.nvim_set_keymap('n', '<C-Q>', ':bufdo bd<CR>', { noremap = true, silent = true })

