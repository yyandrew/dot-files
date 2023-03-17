Plug 'tpope/vim-fugitive'

autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gl :Git log --oneline<CR>
nnoremap <Leader>gp :Git push<CR>

