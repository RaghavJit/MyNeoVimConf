require("config.settings")
require("config.maps")
require("config.lazy")

--local function on_nvim_startup()
--    vim.cmd("ToggleTerm")
--    vim.cmd("Neotree<cr>")
--    vim.cmd("setlocal nonumber")
--    vim.cmd("setlocal norelativenumber")
--    vim.cmd("stopinsert")
--end
vim.cmd [[
  highlight BlinkCmpGhostText guifg=#808080 guibg=NONE ctermfg=gray
]]

