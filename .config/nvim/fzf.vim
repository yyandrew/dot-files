Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Ctrl + p open Git files
nmap <C-p> :GFiles --cached --others --exclude-standard<CR>
" Ctrl + e open buffers
nmap <C-e> :Buffers<CR>
nmap ,i :Snippets<CR>
" Press Ctrl + e twice to open previous Buffer
let g:fzf_action = { 'ctrl-e': 'edit' }
if has('nvim')
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""
