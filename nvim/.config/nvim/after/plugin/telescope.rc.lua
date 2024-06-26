
local state, telescope = pcall(require, 'telescope')
if not state then
  return
end

telescope.setup{
  previewers = {

  }
}

vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal wrap]]
local keymap = vim.keymap
-- telescope
keymap.set('n', ',g', "<cmd>Telescope live_grep<CR>")
keymap.set('n', ',G', "<cmd>Telescope grep_string<CR>")
keymap.set('n', ',h', "<cmd>Telescope help_tags<CR>")
keymap.set('n', ',d', "<cmd>Telescope diagnostics<CR>")
keymap.set('n', ',qfh', "<cmd>Telescope quickfixhistory<CR>")
