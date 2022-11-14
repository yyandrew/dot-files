local opt = vim.opt

opt.cursorline = true
opt.number = true
opt.title = true -- 设置窗口的标题为当前打开文件路径
opt.hlsearch = true -- 高亮查询结果
opt.confirm = true -- 提示没有保存文件
opt.exrc = true -- 每个项目有各自的配置文件
opt.undofile = true -- 开启session级undo记录
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.backspace = 'indent,eol,start' -- fix backspace/delete key problem
opt.laststatus = 2 -- to display the status line always
opt.foldmethod = 'indent' -- groups of lines with the same indent form a fold
opt.foldenable = true -- disable folding but sometimes I need it
opt.foldlevelstart = 10
opt.clipboard = 'unnamed' -- make all yanking/deleting operations automatically copy to the system clipboard
