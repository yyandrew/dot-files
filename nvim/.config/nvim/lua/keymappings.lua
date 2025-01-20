-- Setup lspconfig.
local keymap = vim.keymap

keymap.set('n', '<leader>c', ':setlocal spell spelllang=en_us<CR>', { desc = "set english spell only" }) -- Enable spell check
keymap.set('n', '<leader>C', ':setlocal nospell<CR>', { desc = "Set no spell" })                    -- Disable spell check
keymap.set('n', ',s', ':mks!<CR>', { desc = "Save session" })                                       -- 保存当前会话为缓存
keymap.set('n', '<F9>', ':set ignorecase! ignorecase?<CR>', { desc = "Ignore case" })               -- 忽略大小写
keymap.set('n', '<F5>', '"=strftime("%Y-%m-%d")<CR>P', { desc = "Paster current date" })            -- 插入当前时间


keymap.set('n', 'ef', ':edit <cfile><CR>', { desc = "Edit file under cursor" })                     -- If no file find when try to jump then create a new one
keymap.set('n', ',y', ':let @+=@%<CR>', { desc = "Yank current file path to system clipboard" })    -- " yank current file path to system clipboard

keymap.set('n', '<F10>', ':w<CR> :!clear; gcc % -o %< <CR> :!./%<<CR>')                             -- clang

-- buffer configure
keymap.set('n', '<Leader>x', ':bd<CR>', { desc = "Close buffer" })
keymap.set('n', '<Leader>x!', ':bd!<CR>', { desc = "Force close buffer" })
keymap.set('n', 'gp', ':bprevious<CR>', { desc = "Previous buffer" })
keymap.set('n', 'gn', ':bnext<CR>', { desc = "Next buffer" })

keymap.set('n', '<Leader>n', ':noh<CR>') -- Remove search highlight
keymap.set('n', 'cn', ':cnext<CR>')      -- next quickfix window
keymap.set('n', 'cp', ':cpre<CR>')       -- previous quickfix window

keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
keymap.set("n", "<leader>fmg", "<cmd>CellularAutomaton game_of_life<CR>")

-- livedown
keymap.set('n', 'gm', '<cmd>:LivedownToggle<CR>')

-- lazygit
keymap.set('n', '<Leader>gg', ':LazyGit<CR>')

-- Prettier
keymap.set('n', '<leader>F', ':Prettier<CR>')
keymap.set('v', '<leader>F', ':Prettier<CR>')

-- Make search result at middle of screen
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')
--Toggle quickfix
-- keymap.set('n', ',q', '<cmd>:call QuickfixToggle()<CR>', { desc = "Toggle quickfix window" })
-- Edit init.lua
keymap.set('n', '<Leader>E', ':vsplit ~/.config/nvim/init.lua<CR>', { desc = "Edit nvim config file" })
-- Save current file
keymap.set('n', '<Leader>s', ':w<CR>', { desc = "Save changes of current file" })

-- Move selected sections
keymap.set('v', ',j', ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
keymap.set('v', ',k', ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })

-- 编译当前proto文件
keymap.set('n', '<F6>', ':split<CR>:lcd %:h<CR>:terminal<CR>Akratos tool protoc $FILE_NAME<CR>exit<CR>')
-- 在当前文件所在的目录打开terminal
keymap.set('n', '<F7>', ':split<CR>:lcd %:h<CR>:terminal<CR>A', { desc = "Open terminal from current folder" })
-- esc键退出terminal模式
keymap.set('t', '<C-w>j', "<C-\\><C-n><C-w>j", { silent = true })

keymap.set('', ',cr', ':call ClearRegisters()<CR>', { desc = "Clean all registers" })

keymap.set('', ',le', ':LspStop<CR>')
keymap.set('', ',lb', ':LspStart<CR>')
keymap.set('', ';l', ':set list<CR>')
keymap.set('', ';nl', ':set nolist<CR>')

-- if copy chinese content will messed up
keymap.set('', ',cc', ':\'<,\'>:w !ssh "bohe@$(echo $SSH_CONNECTION | awk \'{ print $1}\')" pbcopy<CR>', { desc = 'Copy selection to clipboard over ssh' })

-- gitblame
keymap.set('', ',gbcc', ':GitBlameCopyCommitURL<CR>', { desc = 'Copies the commit URL of current line\'s commit into the system clipboard.' })
keymap.set('', ',gbcf', ':GitBlameCopyFileURL<CR>', { desc = 'Copies the file URL into the system clipboard.' })
