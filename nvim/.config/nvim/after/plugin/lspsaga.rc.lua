local state, lspsaga = pcall(require, "lspsaga")
if not state then
  return
end

lspsaga.setup({
  ui = {
    code_action = ""
  },
})
local keymap = vim.keymap.set

keymap('n', ';gh', '<cmd>Lspsaga lsp_finder<CR>', { desc = "Show the definition, reference and implementation" })
keymap('n', ';ca', '<cmd>Lspsaga code_action<CR>')
keymap('n', ';rn', '<cmd>Lspsaga rename<CR>', { desc = "Rename" })
keymap('n', ';ol', '<cmd>Lspsaga outline<CR>', { desc = "Display outline" })
