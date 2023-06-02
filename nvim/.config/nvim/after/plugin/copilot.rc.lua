
-- 重新定义 Copilot 的快捷键
vim.cmd('imap <silent><script><expr> <C-J> copilot#Accept("")')
vim.cmd("let g:copilot_no_tab_map = v:true")
