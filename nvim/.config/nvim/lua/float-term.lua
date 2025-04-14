-- Add this to your init.lua or create a file like 'float-term.lua' and source it

-- Module for floating terminal management
local M = {}

-- Terminal buffer ID
M.term_buf = nil
-- Terminal window ID
M.term_win = nil

-- Function to get the directory of the current file
function M.get_current_file_directory()
  local current_file = vim.api.nvim_buf_get_name(0)
  if current_file and current_file ~= "" then
    return vim.fn.fnamemodify(current_file, ":h")
  else
    return vim.fn.getcwd()
  end
end

-- Function to create terminal buffer if it doesn't exist
function M.create_term_buf()
  -- Create a new terminal buffer with the proper settings
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set buffer options before terminal creation
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'hide')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'terminal')
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)

  return buf
end

-- Function to toggle the floating terminal
function M.toggle_float_term()
  -- If terminal window exists and is valid, close it
  if M.term_win and vim.api.nvim_win_is_valid(M.term_win) then
    vim.api.nvim_win_close(M.term_win, true)
    M.term_win = nil
    return
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

  -- Create or reuse terminal buffer
  if not M.term_buf or not vim.api.nvim_buf_is_valid(M.term_buf) then
    M.term_buf = M.create_term_buf()

    -- Get the directory of the current file
    local dir = M.get_current_file_directory()

    -- Create terminal with the current file's directory
    vim.cmd('terminal cd ' .. vim.fn.shellescape(dir) .. ' && ' .. vim.o.shell)
  else
    -- Create the floating window first
    M.term_win = vim.api.nvim_open_win(M.term_buf, true, opts)

    -- Set window-local options
    vim.api.nvim_win_set_option(M.term_win, 'winhl', 'Normal:Normal')
    vim.api.nvim_win_set_option(M.term_win, 'winblend', 0)

    -- If terminal exists, send a command to change directory
    local dir = M.get_current_file_directory()
    local term_chan = vim.bo[M.term_buf].channel

    if term_chan > 0 then
      -- Send clear command and change directory
      vim.api.nvim_chan_send(term_chan, "\clear\n")
      vim.api.nvim_chan_send(term_chan, "cd " .. vim.fn.shellescape(dir) .. "\n")
      vim.api.nvim_chan_send(term_chan, "echo 'Changed directory to: " .. dir .. "'\n")
    end

    vim.cmd('startinsert')
    return
  end

  -- Create the floating window
  M.term_win = vim.api.nvim_open_win(M.term_buf, true, opts)

  -- Set window-local options
  vim.api.nvim_win_set_option(M.term_win, 'winhl', 'Normal:Normal')
  vim.api.nvim_win_set_option(M.term_win, 'winblend', 0)

  -- Start insert mode
  vim.cmd('startinsert')
end

-- Set up keybinding to toggle floating terminal
vim.api.nvim_set_keymap('n', ',t', [[<Cmd>lua require('float-term').toggle_float_term()<CR>]],
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', ',t', [[<C-\><C-n><Cmd>lua require('float-term').toggle_float_term()<CR>]],
  { noremap = true, silent = true })

-- Return module table
return M
