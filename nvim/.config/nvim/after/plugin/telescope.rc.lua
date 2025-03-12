
local state, telescope = pcall(require, 'telescope')
if not state then
  return
end

telescope.setup{
  previewers = {

  },
  pickers = {
    diagnostics = {
      sort_by = "severity",
      no_unlisted = true,
      line_width = 20,
    },
    live_grep = {
      line_width = 20,
    }
  }
}

vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal wrap]]
local keymap = vim.keymap
-- telescope
keymap.set('n', ',p', '<cmd>Telescope git_files<CR>')
keymap.set('', ',i', '<cmd>FzfLua Snippets<CR>')
keymap.set('n', ',g', "<cmd>Telescope live_grep<CR>")
keymap.set('n', ',e', "<cmd>Telescope buffers<CR>")
keymap.set('n', ',G', "<cmd>Telescope grep_string<CR>")
keymap.set('n', ',h', "<cmd>Telescope help_tags<CR>")
keymap.set('n', ',d', "<cmd>Telescope diagnostics<CR>")
keymap.set('n', ',qfh', "<cmd>Telescope quickfixhistory<CR>")
