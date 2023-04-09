let mapleader = " "
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')
source ~/.config/nvim/indentLine.vim
source ~/.config/nvim/ack.vim
source ~/.config/nvim/nerdcommenter.vim
source ~/.config/nvim/tlib_vim.vim
source ~/.config/nvim/vim-addon-mw-utils.vim
source ~/.config/nvim/vim-misc.vim
source ~/.config/nvim/vim-easymotion.vim
source ~/.config/nvim/vim-multiple-cursors.vim
source ~/.config/nvim/vim-snippets.vim
source ~/.config/nvim/vim-surround.vim
source ~/.config/nvim/vim-rails.vim
source ~/.config/nvim/vim-fugitive.vim
source ~/.config/nvim/vim-signify.vim
source ~/.config/nvim/vim-tabular.vim
source ~/.config/nvim/vim-bundln.vim
source ~/.config/nvim/auto-pairs.vim
source ~/.config/nvim/vim-rubocop.vim
source ~/.config/nvim/vim-numbertoggle.vim
source ~/.config/nvim/emmet-vim.vim
" source ~/.config/nvim/vim-rspec.vim
source ~/.config/nvim/syntastic.vim
source ~/.config/nvim/editorconfig-vim.vim
source ~/.config/nvim/vim-gitgutter.vim
source ~/.config/nvim/git-messenger.vim
source ~/.config/nvim/vim-repeat.vim
source ~/.config/nvim/vim-jsx.vim
source ~/.config/nvim/ultisnips.vim
" Plug 'vimwiki/vimwiki'
source ~/.config/nvim/dart-vim-plugin.vim
source ~/.config/nvim/vim-endwise.vim
source ~/.config/nvim/ri.vim
source ~/.config/nvim/vim-tsx.vim
source ~/.config/nvim/vim-textobj-user.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/vim-tldr.vim
source ~/.config/nvim/vimproc.vim
" colorscheme
source ~/.config/nvim/colorscheme.vim
" source ~/.config/nvim/coc.vim
source ~/.config/nvim/echodoc.vim
" Plug 'vim-scripts/YankRing.vim'
source ~/.config/nvim/vim-peekaboo.vim
source ~/.config/nvim/vim-abolish.vim
source ~/.config/nvim/vim-dogo.vim
source ~/.config/nvim/nvim-tree.vim
source ~/.config/nvim/vim-livedown.vim
source ~/.config/nvim/nvim-lspconfig.vim
source ~/.config/nvim/nvim-cmp.vim
source ~/.config/nvim/nvim-treesitter.vim
source ~/.config/nvim/vim-prettier.vim
source ~/.config/nvim/vim-rhubarb.vim
source ~/.config/nvim/nvim-dap.vim
source ~/.config/nvim/vim-dadbod.vim
source ~/.config/nvim/copilot.vim
source ~/.config/nvim/cellular-automaton.vim
source ~/.config/nvim/telescope.nvim
source ~/.config/nvim/lualine.nvim

call plug#end()
filetype plugin indent on    " required

"""""""""""""""""""""""""""
" put your custom stuff here
"""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*,*/app/assets/images/*,*/node_modules/* " Exclude files and directories
" convert tabs to spaces
" switch between case sensitive and insensitive search
" fix backspace/delete key problem
let g:vim_markdown_folding_disabled=1

" let g:solarized_termcolors = 256

" 设置 swap 文件的目录
set directory=$HOME/.vim/swp//

" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e
" Make search result at middle of screen
nnoremap n nzz
nnoremap N Nzz

"""""""""""""""""""""""""""
" MRU configure
"""""""""""""""""""""""""""
let MRU_Auto_Close = 0

function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearRegisters call ClearRegisters()

" Toggle quickfix
nnoremap <Leader>q :call QuickfixToggle()<CR>
let g:quickfix_is_open = 0
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

" 设置 swap 文件的目录
set directory=$HOME/.vim/swp//
" 设置undo文件夹
set undodir=$HOME/.vim/undodir
"""""""""""""""""""""""""""
" Omni completion
"""""""""""""""""""""""""""
" Provides smart autocompletion for programs
" set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,noinsert

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
nnoremap <leader>class :-1read $HOME/.vim/.skeleton.rb<CR>A
" Edit vimrc
nnoremap <Leader>! :source ~/.vimrc<CR>
" Reload vimrc
nnoremap <Leader>e :vsplit ~/.vimrc<CR>
" Save current file
nnoremap <Leader>s :w<CR>

" Move selected sections
vnoremap ,j :m '>+1<CR>gv=gv
vnoremap ,k :m '<-2<CR>gv=gv
" 输入q@，之后按<space>自动转换成andrew@ekohe.com
iabbrev q@ qqerqqer@126.com

autocmd BufNewFile, BufRead .git/COMMIT_EDITMSG setlocal spell spelllang=en_us

" add delete method
onoremap m :normal! ?^def<cr>:nohlsearch<cr>kV/end<cr>

lua require('init')
" Make % jump between conflict
packadd! matchit
let b:match_words = '<<<<<<<:=======:>>>>>>>'

colorscheme onedark

" esc键退出terminal模式
tnoremap <Esc> <C-\><C-n>
" 编译当前proto文件
map <F6> :split<CR>:lcd %:h<CR>:terminal<CR>Akratos tool protoc $FILE_NAME<CR>exit<CR>
" 在当前文件所在的目录打开terminal
map <F7> :split<CR>:lcd %:h<CR>:terminal<CR>
