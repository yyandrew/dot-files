" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')
call plug#end()
filetype plugin indent on    " required

function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearRegisters call ClearRegisters()

function! QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction


"""""""""""""""""""""""""""
" vimwiki configure
"""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Qsync//vimwiki/', 'nested_syntaxes': {'ruby': 'ruby', 'javascript': 'javascript', 'sh': 'sh', 'bash': 'bash'}}]

" let &t_SI = "\e[3 q"
" let &t_EI = "\e[2 q"

"""""""""""""""""""""""""""
" optional reset cursor on start:
"""""""""""""""""""""""""""
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

"""""""""""""""""""""""""""
" textobj configuration
"""""""""""""""""""""""""""
" call textobj#user#plugin('ruby', {
" \   'doend': {
" \     'pattern': ['do', 'end'],
" \     'select-a': 'ad',
" \     'select-i': 'id',
" \   },
" \   'itend': {
" \     'pattern': ['it', 'end'],
" \     'select-a': 'ai',
" \     'select-i': 'ii',
" \   },
" \   'defend': {
" \     'pattern': ['def', 'end'],
" \     'select-a': 'af',
" \     'select-i': 'if',
" \   },
" \ })


" let g:python3_host_prog="/home/andrew/.asdf/shims/python3"
" 输入q@，之后按<space>自动转换成andrew@ekohe.com
iabbrev q@ qqerqqer@126.com


lua require('init')
" Make % jump between conflict
packadd! matchit
let b:match_words = '<<<<<<<:=======:>>>>>>>'



