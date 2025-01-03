return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
        size = 10,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = false,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            highlights = {
                border = "double",
                background = "winhighlight",
            },
        }
    }) 

    local keymap = vim.keymap.set
    local s_opts = { silent = true }
    keymap("t", "<esc>", [[<C-\><C-n>]], s_opts)
  end,
}
