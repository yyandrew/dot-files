
local state, gitblame = pcall(require, "gitblame")
if not state then
  return
end

gitblame.setup({
  date_format = "%Y-%m-%d %H:%M:%S", -- template for the date, check Date format section for more options
  virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
  schedule_event = 'CursorHold',
  clear_event = 'CursorHoldI',
})
