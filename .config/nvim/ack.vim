Plug 'mileszs/ack.vim'

cnoreabbrev Ack Ack!
nnoremap <Leader>a<space> :Ack!<Space>
nnoremap <Leader>ac :Ack!<Space><cword>
" let g:ackprg = 'ag --nogroup --nocolor --column'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1


