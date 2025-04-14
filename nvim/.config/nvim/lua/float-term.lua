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

  -- Get the directory of the current file
  local dir = M.get_current_file_directory()

  -- Check if we have a valid terminal buffer
  local has_valid_term = M.term_buf and
                         vim.api.nvim_buf_is_valid(M.term_buf) and
                         vim.api.nvim_buf_get_option(M.term_buf, 'buftype') == 'terminal'

  if not has_valid_term then
    -- Create a completely fresh terminal buffer using vim's built-in command
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd('botright new')
    vim.cmd('terminal')
    M.term_buf = vim.api.nvim_get_current_buf()

    -- Set terminal buffer options
    vim.api.nvim_buf_set_option(M.term_buf, 'bufhidden', 'hide')

    -- Close the temporary window and return to original window
    vim.cmd('hide')
    vim.api.nvim_set_current_win(current_win)
  end

  -- Create the floating window
  M.term_win = vim.api.nvim_open_win(M.term_buf, true, opts)

  -- Set window-local options
  vim.api.nvim_win_set_option(M.term_win, 'winhl', 'Normal:Normal')
  vim.api.nvim_win_set_option(M.term_win, 'winblend', 0)

  -- Get terminal job ID using built-in vim function
  local term_job_id = vim.fn.getbufvar(M.term_buf, 'terminal_job_id', 0)

  if term_job_id and term_job_id > 0 then
    -- Use chansend instead of chan_send for better compatibility
    vim.fn.chansend(term_job_id, "cd " .. vim.fn.shellescape(dir) .. "\n")
    vim.fn.chansend(term_job_id, "echo 'Changed directory to: " .. dir .. "'\n")
  end

  -- Enter insert mode
  vim.cmd('startinsert')
end

-- Set up keybinding to toggle floating terminal
vim.api.nvim_set_keymap('n', '<F12>', [[<Cmd>lua require('float-term').toggle_float_term()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<F12>', [[<C-\><C-n><Cmd>lua require('float-term').toggle_float_term()<CR>]], { noremap = true, silent = true })

-- Return module table
return M
