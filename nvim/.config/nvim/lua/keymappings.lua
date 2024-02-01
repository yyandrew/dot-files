-- Setup lspconfig.
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "tsserver", "rust_analyzer", "volar", "lua_ls" }
})
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
  buf_set_keymap('n', '<Leader>dd', '<cmd>lua vim.diagnostic.disable()<CR>', opts)
  buf_set_keymap('n', '<Leader>de', '<cmd>lua vim.diagnostic.enable()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer', 'tsserver', 'solargraph', 'volar', 'lua_ls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      preferences = {
        disableSuggestions = true,
      }
    },
    capabilities = capabilities,
  }
end

nvim_lsp['gopls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

local keymap = vim.keymap
local cmd = vim.cmd

keymap.set('n', "<F2>", ":NvimTreeToggle<CR>")                                                      -- nvim-tree keymaps
keymap.set('n', ',f', ':NvimTreeFindFile<CR>')                                                      -- Reveal file in tree
keymap.set('n', '<leader>c', ':setlocal spell spelllang=en_us<CR>', { desc = "set english spell" }) -- Enable spell check
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

-- telescope
keymap.set('n', ',g', "<cmd>Telescope live_grep<CR>")
keymap.set('n', ',G', "<cmd>Telescope grep_string<CR>")
keymap.set('n', ',h', "<cmd>Telescope help_tags<CR>")
keymap.set('n', ',d', "<cmd>Telescope diagnostics<CR>")
keymap.set('n', '<Leader>!', ":runtime init<CR>")

require('nvim-tree').setup {
  update_focused_file = {
    enable = true,
    update_root = true,
  },
}

-- fzf
-- Ctrl + p open Git files
keymap.set('n', ',p', ':GFiles --cached --others --exclude-standard<CR>')
-- ,e open buffers
keymap.set('', ',e', '<cmd>:Buffers<CR>')
keymap.set('', ',i', '<cmd>:Snippets<CR>')

-- livedown
keymap.set('n', 'gm', '<cmd>:LivedownToggle<CR>')

-- rubocop
keymap.set('n', ',r', ':RuboCop -a<CR>', { desc = "Auto correct code" })

-- git
keymap.set('n', '<Leader>gs', ':Git<CR>')
keymap.set('n', '<Leader>gl', ':Git log --oneline<CR>')
keymap.set('n', '<Leader>gp', ':Git push<CR>')
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

-- codeium
keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

keymap.set('', ',le', ':LspStop<CR>')
keymap.set('', ',lb', ':LspStart<CR>')
keymap.set('', ';l', ':set list<CR>')
keymap.set('', ';nl', ':set nolist<CR>')
