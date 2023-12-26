local HOME = os.getenv('HOME')
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
opt.directory= HOME .. '/.vim/swp//' -- 设置 swap 文件的目录
opt.undodir = HOME .. '/.vim/undodir' -- 设置undo文件夹
opt.wildignore:append('*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*,*/app/assets/images/*,*/node_modules/*') -- Exclude files and directories

-- Config indentLine
g.indentLine_char = '┊'
g.indentLine_enabled = 1
-- Specify how much indent level do you want to use for(default is 10)
g.indentLine_indentLevel = 20

vim.cmd([[
  colorscheme onedark
]])

-- Config fzf
g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
local fzf_action = {}
fzf_action['ctrl-t'] = 'tab split'
fzf_action['ctrl-v'] = 'vsplit'
g.fzf_action = fzf_action
vim.env.FZF_DEFAULT_OPTS = "--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""

-- Config livedown
g.livedown_browser = 'chrome'

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = 'fugitive://*',
  command = 'set bufhidden=delete'
})

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '.git/COMMIT_EDITMSG',
  command = 'setlocal spell spelllang=en_us'
})

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '.git/COMMIT_EDITMSG',
  command = 'setlocal spell spelllang=en_us'
})

-- gitgutter
g.gitgutter_preview_win_floating = 1
opt.updatetime = 1000

-- echodoc
g.echodoc_enable_at_startup = 1
--let g:echodoc#type = 'floating'
--highlight link EchoDocFloat Pmenu
local snip_mate = {}
snip_mate['snippet_version'] = 1
g.snipMate = snip_mate

-- Config dadbog
g.dbs = {
  food_dev = 'mysql://bhuser:363099@localhost:3306/food_dev',
  redis_dev = 'redis://127.0.0.1:6379',
  redis_rc1 = 'redis://172.16.0.22:26379/',
  redis_rc2 = 'redis://172.16.0.24:26379/',
}
g.db_ui_save_location = '/tmp/db_ui'

-- EchoDoc,好像不工作
g.echodoc = {
  enable_at_startup = 1,
  type = 'floating'
}

-- nerdcommenter
g.NERDSpaceDelims = 1

g.vim_markdown_folding_disabled = 1

-- remove trailing whitespaces automatically
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

g.quickfix_is_open = 0

-- vroom配置
g.vroom_test_unit_command="rake test TESTOPTS='--name //'"

local clearRegisters = vim.api.nvim_exec([[
function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction
]], true)


-- 解决ruby文件输入 . 导致的当前行的 indent 跟 end 对齐的问题
vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]
