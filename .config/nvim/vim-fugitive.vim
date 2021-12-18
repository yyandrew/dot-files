Plug 'tpope/vim-fugitive'

autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gs :Git<CR>

