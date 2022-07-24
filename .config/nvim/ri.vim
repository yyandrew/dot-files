Plug 'danchoi/ri.vim'

nnoremap  ,ri :call ri#OpenSearchPrompt(0)<cr> " horizontal split
nnoremap  ,RI :call ri#OpenSearchPrompt(1)<cr> " vertical split
nnoremap  ,RK :call ri#LookupNameUnderCursor()<cr> " keyword lookup

