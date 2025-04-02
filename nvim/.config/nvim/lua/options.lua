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
opt.backspace = 'indent,eol,start'                                                                         -- fix backspace/delete key problem
opt.laststatus = 2                                                                                         -- to display the status line always
opt.foldmethod = 'indent'                                                                                  -- groups of lines with the same indent form a fold
opt.foldenable = true                                                                                      -- disable folding but sometimes I need it
opt.foldlevelstart = 10
opt.clipboard = 'unnamed'                                                                                  -- make all yanking/deleting operations automatically copy to the system clipboard
opt.directory = HOME .. '/.vim/swp//'                                                                      -- 设置 swap 文件的目录
opt.undodir = HOME .. '/.vim/undodir'                                                                      -- 设置undo文件夹
opt.wildignore:append('*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*,*/app/assets/images/*,*/node_modules/*') -- Exclude files and directories
-- 设置空格显示字符
opt.listchars = {
  space = "·",
  tab = ">~"
}
opt.relativenumber = true

-- Config indentLine
g.indentLine_char = '┊'
g.indentLine_enabled = 1
-- Specify how much indent level do you want to use for(default is 10)
g.indentLine_indentLevel = 20

-- habamax, palenight, dracula, tokyonight-night
vim.cmd([[
  colorscheme habamax
]])

-- Config livedown
g.livedown_browser = 'chrome'

-- gitgutter
g.gitgutter_preview_win_floating = 1
opt.updatetime = 1000

-- nerdcommenter
g.NERDSpaceDelims = 1 -- Add space around after commented

g.vim_markdown_folding_disabled = 1

-- remove trailing whitespaces automatically
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.proto',
  callback = function()
    local old_folder = vim.fn.getcwd()
    local working_folder = vim.fn.expand("%:h")
    -- jump to folder of current editing file
    local cmd = "cd " .. working_folder
    local ok, re = pcall(vim.api.nvim_command, cmd)
    if not ok then
      print("Error switch to folder: " .. working_folder ". Err: " .. tostring(re))
    end
    cmd = "! kratos tool protoc " .. vim.fn.expand("%:t") .. " &> /dev/null"
    ok, re = pcall(vim.api.nvim_command, cmd)
    if not ok then
      print("Error generate pb files: " .. tostring(re))
    end
    -- jump back to root folder
    cmd = "cd " .. old_folder
    pcall(vim.api.nvim_command, cmd)
  end,
})

g.quickfix_is_open = 0

-- 解决ruby文件输入 . 导致的当前行的 indent 跟 end 对齐的问题
vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]

-- 配置lsp的错误提示
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- git-message
g.git_messenger_always_into_popup = true
g.git_messenger_date_format = '%Y-%m-%d %X'
g.git_messenger_floating_win_opts = { border = 'single' }
g.git_messenger_popup_content_margins = 'v:false'
