vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Resize window with Ctrl + arrow keys
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true })

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

-- Function to close the current buffer without closing the window
local function close_buffer_without_closing_window()
  local current_buf = vim.api.nvim_get_current_buf()
  if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
    vim.cmd('bd')
  else
    vim.cmd('enew')
  end
  vim.cmd('bwipeout ' .. current_buf)
end

-- Key mapping in normal mode for <leader>w
vim.api.nvim_set_keymap('n', '<C-w>', ':bp<bar>sp<bar>bn<bar>bd<CR>', { noremap = true, silent = true })

-- Map Ctrl+Q to close all buffers
vim.api.nvim_set_keymap('n', '<C-q>', ':qa!', { noremap = true, silent = true })

