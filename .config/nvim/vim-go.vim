Plug 'fatih/vim-go'

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_doc_popup_window = 1
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>d <Plug>(go-describe)
au FileType go nmap <leader>r <Plug>(go-run)


