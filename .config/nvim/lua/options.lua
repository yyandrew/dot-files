local opt = vim.opt
local g = vim.g

opt.cursorline = true
opt.number = true
opt.title = true    -- 设置窗口的标题为当前打开文件路径
opt.hlsearch = true -- 高亮查询结果
opt.confirm = true  -- 提示没有保存文件
opt.exrc = true     -- 每个项目有各自的配置文件
opt.undofile = true -- 开启session级undo记录
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.backspace = 'indent,eol,start' -- fix backspace/delete key problem
opt.laststatus = 2                 -- to display the status line always
opt.foldmethod = 'indent'          -- groups of lines with the same indent form a fold
opt.foldenable = true              -- disable folding but sometimes I need it
opt.foldlevelstart = 10
opt.clipboard = 'unnamed'          -- make all yanking/deleting operations automatically copy to the system clipboard

-- Config indentLine
g.indentLine_char = '┊'
g.indentLine_enabled = 1
-- Specify how much indent level do you want to use for(default is 10)
g.indentLine_indentLevel = 20

-- Config ack
vim.cmd('cnoreabbrev Ack Ack!')
g.ackprg = 'rg --vimgrep --type-not sql --smart-case'
g.ackhighlight = 1

-- Config fzf
g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
local fzf_action = {}
fzf_action['ctrl-t'] = 'tab split'
fzf_action['ctrl-v'] = 'vsplit'
g.fzf_action = fzf_action
vim.env.FZF_DEFAULT_OPTS = "--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""

-- Config livedown
g.livedown_browser = 'firefox'

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = 'fugitive://*',
  command = 'set bufhidden=delete'
})

-- Config autopair
g.AutoPairsMapSpace = 0

-- gitgutter
g.gitgutter_preview_win_floating = 1
opt.updatetime=1000

-- echodoc
g.echodoc_enable_at_startup = 1
--let g:echodoc#type = 'floating'
--highlight link EchoDocFloat Pmenu
local snip_mate = {}
snip_mate['snippet_version'] = 1
g.snipMate = snip_mate

