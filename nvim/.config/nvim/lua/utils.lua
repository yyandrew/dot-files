-- Add this to your init.lua or create a file like 'float-term.lua' and source it

-- Module for floating terminal management
local M = {}
function M.get_file_path()
  local lineNum = vim.api.nvim_win_get_cursor(0)[1]
  vim.fn.setreg('+', vim.fn.expand('%') .. ':' .. lineNum)
end

vim.keymap.set('n', ',y', [[<Cmd>lua require('utils').get_file_path()<CR>]], { noremap = true, silent = true, desc = "Yank current file path to system clipboard" })    -- " yank current file path to system clipboard

-- Return module table
return M
