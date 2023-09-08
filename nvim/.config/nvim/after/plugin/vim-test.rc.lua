local g = vim.g
g['test#strategy'] = {
  nearest = 'vimux',
  file = 'vimux',
  suite = 'basic'
}
g['test#go#gotest#options'] = '-v'
g['test#ruby#minitest#options'] = '-v'

local keymap = vim.keymap.set
keymap('n', ';t', '<cmd>TestNearest<cr>', { desc = "Run nearet test" })
keymap('n', ';T', '<cmd>TestFile<cr>', { desc = "Run all tests in the file" })
