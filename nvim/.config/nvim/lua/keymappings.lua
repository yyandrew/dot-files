-- Setup lspconfig.
local keymap = vim.keymap

keymap.set('n', '<leader>c', ':setlocal spell spelllang=en_us<CR>', { desc = "set english spell only" }) -- Enable spell check
keymap.set('n', '<leader>C', ':setlocal nospell<CR>', { desc = "Set no spell" })                         -- Disable spell check
keymap.set('n', ',s', ':mks!<CR>', { desc = "Save session" })                                            -- 保存当前会话为缓存
keymap.set('n', '<F9>', ':set ignorecase! ignorecase?<CR>', { desc = "Ignore case" })                    -- 忽略大小写
keymap.set('n', '<F5>', '"=strftime("%Y-%m-%d")<CR>P', { desc = "Paster current date" })                 -- 插入当前时间

keymap.set('x', '<leader>p', [["_dP]], { desc = "Paste without yank" })

keymap.set('n', '<F10>', ':w<CR> :!clear; gcc % -o %< <CR> :!./%<<CR>') -- clang

-- buffer configure
keymap.set('n', 'gp', ':bprevious<CR>', { desc = "Previous buffer" })
keymap.set('n', 'gn', ':bnext<CR>', { desc = "Next buffer" })

keymap.set('n', '<Leader>n', ':noh<CR>') -- Remove search highlight
keymap.set('n', 'cn', ':cnext<CR>')      -- next quickfix window
keymap.set('n', 'cp', ':cpre<CR>')       -- previous quickfix window

-- lazygit
keymap.set('n', ';gg', ':LazyGit<CR>')

-- Prettier
keymap.set('n', '<leader>F', ':Prettier<CR>')
keymap.set('v', '<leader>F', ':Prettier<CR>')

-- Make search result at middle of screen
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')
--Toggle quickfix
-- keymap.set('n', ',q', '<cmd>:call QuickfixToggle()<CR>', { desc = "Toggle quickfix window" })
-- Edit init.lua
keymap.set('n', '<Leader>E', ':tabedit<CR>:tcd ~/dot-files/nvim<CR>:e ./.config/nvim/init.lua<CR>',
  { desc = "Edit nvim config file" })
-- Save current file
keymap.set('n', '<Leader>s', ':w<CR>', { desc = "Save changes of current file" })

-- Move selected sections
keymap.set('v', '<leader>j', ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
keymap.set('v', '<leader>k', ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })

-- 在当前文件所在的目录打开terminal
keymap.set('n', '<F7>', ':split<CR>:lcd %:h<CR>:terminal<CR>A', { desc = "Open terminal from current folder" })
-- esc键退出terminal模式
keymap.set('t', '<C-w>j', "<C-\\><C-n><C-w>j", { silent = true })

keymap.set('', ',le', ':LspStop<CR>')
keymap.set('', ',lb', ':LspStart<CR>')
keymap.set('', ';l', ':set list<CR>')
keymap.set('', ';nl', ':set nolist<CR>')

-- gitblame
keymap.set('', ',gbcc', ':GitBlameCopyCommitURL<CR>',
  { desc = 'Copies the commit URL of current line\'s commit into the system clipboard.' })
keymap.set('', ',gbcf', ':GitBlameCopyFileURL<CR>', { desc = 'Copies the file URL into the system clipboard.' })
keymap.set('v', ',j', ':!jq .<CR>')
keymap.set('', ',cm', ':! git checkout master %<CR>')
keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc =  'Add workspace folder' })
keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = 'Remove workspace folder' })

keymap.set("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = 'List workspace folders' } )
