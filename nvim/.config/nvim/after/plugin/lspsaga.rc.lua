local state, lspsaga = pcall(require, "lspsaga")
if not state then
  return
end

lspsaga.setup()
local keymap = vim.keymap.set

keymap('n', ';gh', '<cmd>Lspsaga lsp_finder<CR>')
keymap('n', ';ca', '<cmd>Lspsaga code_action<CR>')
keymap('n', ';rn', '<cmd>Lspsaga rename<CR>')
