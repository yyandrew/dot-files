Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Ctrl + p open Git files
nmap <C-p> :GFiles --cached --others --exclude-standard<CR>
" ,e open buffers
nmap ,e :Buffers<CR>
nmap ,i :Snippets<CR>
if has('nvim')
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""
