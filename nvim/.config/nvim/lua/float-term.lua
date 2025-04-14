-- Add this to your init.lua or create a file like 'float-term.lua' and source it

-- Module for floating terminal management
local M = {}

-- Terminal buffer ID
M.term_buf = nil
-- Terminal window ID
M.term_win = nil

-- Function to toggle the floating terminal
function M.toggle_float_term()
  -- If terminal window exists and is valid, close it
  if M.term_win and vim.api.nvim_win_is_valid(M.term_win) then
    vim.api.nvim_win_close(M.term_win, true)
    M.term_win = nil
    return
  end

  -- Create or find terminal buffer
  if not M.term_buf or not vim.api.nvim_buf_is_valid(M.term_buf) then
    -- Create a new terminal buffer with the proper settings
    M.term_buf = vim.api.nvim_create_buf(false, true)

    -- Set buffer options before terminal creation
    vim.api.nvim_buf_set_option(M.term_buf, 'bufhidden', 'hide')
    vim.api.nvim_buf_set_option(M.term_buf, 'filetype', 'terminal')
    vim.api.nvim_buf_set_option(M.term_buf, 'modifiable', true)
  end

  -- Calculate floating window size
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  -- Calculate floating window position
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Window options
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded'
  }

  -- Create the floating window
  M.term_win = vim.api.nvim_open_win(M.term_buf, true, opts)

  -- Set some window-local options
  vim.api.nvim_win_set_option(M.term_win, 'winhl', 'Normal:Normal')
  vim.api.nvim_win_set_option(M.term_win, 'winblend', 0)

  -- Start terminal if not already started
  if vim.bo[M.term_buf].channel == 0 then
    vim.fn.termopen(vim.o.shell)
    vim.cmd('startinsert')
  else
    vim.cmd('startinsert')
  end
end

-- Set up keybinding to toggle floating terminal
vim.api.nvim_set_keymap('n', ',t', [[<Cmd>lua require('float-term').toggle_float_term()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', ',t', [[<C-\><C-n><Cmd>lua require('float-term').toggle_float_term()<CR>]], { noremap = true, silent = true })

-- Return module table
return M
