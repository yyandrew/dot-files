local keymap = vim.keymap

-- Ctrl + p open Git files
keymap.set('n', ',p', ':GFiles --cached --others --exclude-standard<CR>')
-- ,e open buffers
keymap.set('', ',e', '<cmd>:Buffers<CR>')
keymap.set('', ',i', '<cmd>:Snippets<CR>')

