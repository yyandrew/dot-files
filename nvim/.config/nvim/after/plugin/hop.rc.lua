local state, hop = pcall(require, "hop")
if not state then
  return
end
local directions = require('hop.hint').HintDirection
local keymap = vim.keymap.set
keymap('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
keymap('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
keymap('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
keymap('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
keymap('', '<leader>j', function()
  hop.hint_lines()
end, {remap=true})
keymap('', '<leader>k', function()
  hop.hint_lines()
end, {remap=true})
