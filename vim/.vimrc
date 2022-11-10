let mapleader = " "
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')
source ~/.config/nvim/indentLine.vim
source ~/.config/nvim/ack.vim
source ~/.config/nvim/nerdcommenter.vim
source ~/.config/nvim/tlib_vim.vim
source ~/.config/nvim/vim-addon-mw-utils.vim
source ~/.config/nvim/vim-misc.vim
source ~/.config/nvim/vim-buffergator.vim
source ~/.config/nvim/vim-easymotion.vim
source ~/.config/nvim/vim-multiple-cursors.vim
source ~/.config/nvim/vim-snippets.vim
source ~/.config/nvim/vim-surround.vim
source ~/.config/nvim/vim-rails.vim
source ~/.config/nvim/vim-airline.vim
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

call plug#end()
filetype plugin indent on    " required

"""""""""""""""""""""""""""
" put your custom stuff here
"""""""""""""""""""""""""""
set cursorline "设置光标所在行显示横线
set number " 显示行号
set title " 设置窗口的标题为当前打开文件路径
set hlsearch " 高亮查询结果
set confirm " 提示没有保存文件
set exrc " 每个项目有各自的配置文件
set undofile " 开启session级undo记录
set undodir=~/.vim/undodir
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*,*/app/assets/images/*,*/node_modules/* " Exclude files and directories
" convert tabs to spaces
set expandtab
set shiftwidth=2
set softtabstop=2
" switch between case sensitive and insensitive search
nmap <F9> :set ignorecase! ignorecase?<CR>
" fix backspace/delete key problem
set backspace=indent,eol,start
" to display the status line always
set laststatus=2
" make sure the fancy symbols always display
let g:Powerline_symbols = 'fancy'
let g:vim_markdown_folding_disabled=1
" groups of lines with the same indent form a fold
set foldmethod=indent
" disable folding but sometimes I need it
set foldenable
set foldlevelstart=10
" make all yanking/deleting operations automatically copy to the system clipboard
set clipboard=unnamed
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
" buffer configure
"""""""""""""""""""""""""""
map  <Leader>x :bd<CR>
map  <Leader>x! :bd!<CR>

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
" next quickfix window
nnoremap cn :cnext<CR>
" previous quickfix window
nnoremap cp :cpre<CR>

"""""""""""""""""""""""""""
" clang
"""""""""""""""""""""""""""
map <F10> :w<CR> :!clear; gcc % -o %< <CR> :!./%<<CR>


" Remove search highlight
nnoremap <Leader>n :noh<CR>

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


"""""""""""""""""""""""""""
" ctags
"""""""""""""""""""""""""""
nmap ,c :!ctags %<CR>
"""""""""""""""""""""""""""
" yank current file path to system clipboard
"""""""""""""""""""""""""""
nmap ,y :let @+=@%<CR>
" let g:python3_host_prog="/home/andrew/.asdf/shims/python3"
nnoremap <leader>class :-1read $HOME/.vim/.skeleton.rb<CR>A
" Edit vimrc
nnoremap <Leader>! :source ~/.vimrc<CR>
" Reload vimrc
nnoremap <Leader>e :vsplit ~/.vimrc<CR>
" Save current file
nnoremap <Leader>s :w<CR>

" Enable spell check
nnoremap <Leader>c :setlocal spell spelllang=en_us<CR>
" Disable spell check
nnoremap <Leader>C :setlocal nospell<CR>
" Move selected sections
vnoremap ,j :m '>+1<CR>gv=gv
vnoremap ,k :m '<-2<CR>gv=gv
" 输入q@，之后按<space>自动转换成andrew@ekohe.com
iabbrev q@ qqerqqer@126.com

autocmd BufNewFile, BufRead .git/COMMIT_EDITMSG setlocal spell spelllang=en_us

" add delete method
onoremap m :normal! ?^def<cr>:nohlsearch<cr>kV/end<cr>

" If no file find when try to jump then create a new one
map gf :edit <cfile><CR>

" F2 open/close nvim-tree
map <F2> :NvimTreeToggle<CR>
" Reveal file in tree
nmap ,f :NvimTreeFindFile<CR>

lua require('init')
" Make % jump between conflict
packadd! matchit
let b:match_words = '<<<<<<<:=======:>>>>>>>'

" Save current session
nmap ,s :mks!<CR>

colorscheme onedark

" esc键退出terminal模式
tnoremap <Esc> <C-\><C-n>

" 插入当前时间
nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
