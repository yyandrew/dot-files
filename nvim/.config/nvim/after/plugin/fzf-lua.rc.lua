
local state, fzf_lua = pcall(require, 'fzf-lua')
if not state then
  return
end

fzf_lua.setup{
}

local keymap = vim.keymap
-- telescope
keymap.set('n', ',g', "<cmd>FzfLua live_grep<CR>")
keymap.set('n', ',e', "<cmd>FzfLua buffers<CR>")
keymap.set('n', ',G', "<cmd>FzfLua grep_cword<CR>")
keymap.set('n', ',h', "<cmd>FzfLua helptags<CR>")
keymap.set('n', ',d', "<cmd>FzfLua diagnostics<CR>")
keymap.set('n', ',qfh', "<cmd>FzfLua quickfix_stack<CR>")
