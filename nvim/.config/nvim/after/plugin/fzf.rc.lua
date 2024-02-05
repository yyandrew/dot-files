local keymap = vim.keymap

-- Ctrl + p open Git files
keymap.set('n', ',p', ':GFiles --cached --others --exclude-standard<CR>')
-- ,e open buffers
keymap.set('', ',e', '<cmd>:Buffers<CR>')
keymap.set('', ',i', '<cmd>:Snippets<CR>')

-- Config fzf
vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
local fzf_action = {}
fzf_action['ctrl-t'] = 'tab split'
fzf_action['ctrl-v'] = 'vsplit'
vim.g.fzf_action = fzf_action
vim.env.FZF_DEFAULT_OPTS = "--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""

