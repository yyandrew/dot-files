local keymap = vim.keymap
-- telescope
keymap.set('n', ',g', "<cmd>Telescope live_grep<CR>")
keymap.set('n', ',G', "<cmd>Telescope grep_string<CR>")
keymap.set('n', ',h', "<cmd>Telescope help_tags<CR>")
keymap.set('n', ',d', "<cmd>Telescope diagnostics<CR>")

