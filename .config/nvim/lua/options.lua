local opt = vim.opt

opt.cursorline = true
opt.number = true
opt.title = true -- 设置窗口的标题为当前打开文件路径
opt.hlsearch = true -- 高亮查询结果
opt.confirm = true -- 提示没有保存文件
opt.exrc = true -- 每个项目有各自的配置文件
opt.undofile = true -- 开启session级undo记录
opt.undodir = '~/.vim/undodir'
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
