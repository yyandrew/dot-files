Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" coc-prettier configuration

nmap <leader>F :CocCommand prettier.formatFile<CR>
vmap <leader>f <Plug>(coc-format-selected)

" coc-eslint configuration
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix

" go to difinition
nmap <silent> gd <Plug>(coc-definition)
" coc error
nmap <silent> <C-k> <Plug>(coc-diagnostic-next-error)
nmap <silent> <C-K> <Plug>(coc-diagnostic-next)
" Hide float window after the <C-c>
inoremap <C-c> <ESC>

" coc float window scrollable
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Coc outline
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>


