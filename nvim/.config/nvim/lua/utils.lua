local M = {}
function M.get_file_path()
  local lineNum = vim.api.nvim_win_get_cursor(0)[1]
  local fileWithNum = vim.fn.expand('%') .. ':' .. lineNum
  vim.fn.setreg('+', fileWithNum)
  vim.notify("copyed: " .. fileWithNum, vim.log.levels.INFO)
end

vim.keymap.set('n', ',y', [[<Cmd>lua require('utils').get_file_path()<CR>]], { noremap = true, silent = true, desc = "Yank current file path to system clipboard" })    -- " yank current file path to system clipboard

-- Return module table
return M
