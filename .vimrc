set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/rking/ag.vim.git'
Plugin 'https://github.com/mattn/gist-vim.git'
Plugin 'https://github.com/mattn/webapi-vim.git'
Plugin 'https://github.com/yegappan/mru.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/tomtom/tlib_vim.git'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
" Plugin 'https://github.com/craigemery/vim-autotag.git'
Plugin 'https://github.com/jeetsukumaran/vim-buffergator.git'
" Plugin 'https://github.com/kchmck/vim-coffee-script.git'
Plugin 'https://github.com/Lokaltog/vim-easymotion.git'
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Surround your code :)
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'https://github.com/tpope/vim-rails.git'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'rainerborene/vim-reek'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-bundler'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ngmy/vim-rubocop'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'mattn/emmet-vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'fatih/vim-go'
Plugin 'vim-syntastic/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
" Plugin 'dracula/vim'
Plugin 'rhysd/git-messenger.vim'
Plugin 'tpope/vim-repeat'
" Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'Quramy/tsuquyomi'
Plugin 'vimwiki/vimwiki'

call vundle#end()            " required
filetype plugin indent on    " required

" Change the default leader
let mapleader = "\\"
" map \d as dd
nnoremap <leader>d dd

"""""""""""""""""""""""""""
" put your custom stuff here
"""""""""""""""""""""""""""
nnoremap <F3> :set invpaste paste?<CR>
imap <F3> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F3>
set cul "设置光标所在行显示横线
set number " 显示行号
set hlsearch " 高亮查询结果
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*,*/app/assets/images/*,*/node_modules/* " Exclude files and directories
" convert tabs to spaces
set expandtab
set shiftwidth=2
set softtabstop=2
" switch between case sensitive and insensitive search
nmap <F9> :set ignorecase! ignorecase?
" fix backspace/delete key problem
set backspace=indent,eol,start
" syntax highlighting and theme
syntax on
" to display the status line always
set laststatus=2
" make sure the fancy symbols always display
let g:Powerline_symbols = 'fancy'
let g:vim_markdown_folding_disabled=1
" groups of lines with the same indent form a fold
set foldmethod=indent
" disable folding but sometimes I need it
set nofoldenable
" make all yanking/deleting operations automatically copy to the system clipboard
set clipboard=unnamed
let g:solarized_termcolors = 256

"""""""""""""""""""""""""""
" vim-reek configure
"""""""""""""""""""""""""""
let g:reek_on_loading = 0

"""""""""""""""""""""""""""
" buffer configure
"""""""""""""""""""""""""""
map  <C-l> :bn<CR>
map  <C-h> :bp<CR>
" map  <C-x> :bd<CR>
map  <C-x>! :bd!<CR>

"""""""""""""""""""""""""""
" ctrlp configure
"""""""""""""""""""""""""""
" Exclude files and directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v(\.log|tags)$'
  \ }
" When opening a file with <cr>, |CtrlP| avoids opening nerdtree
let g:ctrlp_dont_split = 'nerdtree'
" Set starting directory.
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file
let g:ctrlp_working_path_mode = 'a'

"""""""""""""""""""""""""""
" airline configure
"""""""""""""""""""""""""""
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_buffers = 0  " disable displaying buffers with a single tab
let g:airline#extensions#tagbar#enabled = 1

"""""""""""""""""""""""""""
" indentLine configure
"""""""""""""""""""""""""""
" enable indentLine
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1
" Specify how much indent level do you want to use for(default is 10)
let g:indentLine_indentLevel = 20

"""""""""""""""""""""""""""
" custom YouCompleteMe
"""""""""""""""""""""""""""
" remove tab key mappings used to select the first completion string(conflict with vim-snippets)
let g:ycm_key_list_select_completion = ['<Down>']

"""""""""""""""""""""""""""
" easymotion configure
"""""""""""""""""""""""""""
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"""""""""""""""""""""""""""
" MRU configure
"""""""""""""""""""""""""""
let MRU_Auto_Close = 0

"""""""""""""""""""""""""""
" nerdtree configure
"""""""""""""""""""""""""""
" F2 open/close nerdtree
map <F2> :NERDTreeToggle<CR>
" Reveal file in tree
nmap ,f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

"""""""""""""""""""""""""""
" RuboCop configure
"""""""""""""""""""""""""""
" run RuboCop
nmap ,c :RuboCop %<CR>
nmap ,r :RuboCop -a %<CR>

function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearRegisters call ClearRegisters()

"""""""""""""""""""""""""""
" auto-pairs configure
"""""""""""""""""""""""""""
let g:AutoPairsMapSpace = 0

"""""""""""""""""""""""""""
" nerdcommenter configure
"""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1

"""""""""""""""""""""""""""
" vim-rspec configure
"""""""""""""""""""""""""""
map ,t :call RunCurrentSpecFile()<CR>
map ,s :call RunNearestSpec()<CR>
map ,l :call RunLastSpec()<CR>
map ,a :call RunAllSpecs()<CR>


"""""""""""""""""""""""""""
" clang
"""""""""""""""""""""""""""
map <F10> :w<CR> :!clear; gcc % -o %< <CR> :!./%<<CR>

"""""""""""""""""""""""""""
" syntax checks
"""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']

"""""""""""""""""""""""""""
" fugitive config
"""""""""""""""""""""""""""
autocmd BufReadPost fugitive://* set bufhidden=delete

"""""""""""""""""""""""""""
" gitgutter config
"""""""""""""""""""""""""""
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"""""""""""""""""""""""""""
" Set path for find command
"""""""""""""""""""""""""""
set path=$PWD/**

"""""""""""""""""""""""""""
" tagbar configure
"""""""""""""""""""""""""""
nnoremap <silent> <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""
" gruvbox configure
"""""""""""""""""""""""""""
" colorscheme dracula
colorscheme gruvbox
set background=dark


"""""""""""""""""""""""""""
" vim-better-whitespace configure
"""""""""""""""""""""""""""
nmap ,w :StripWhitespace<CR>

"""""""""""""""""""""""""""
" w0rp/ale configure
"""""""""""""""""""""""""""
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace', 'rubocop'],
\   'javascript': ['eslint'],
\}
let g:ale_lint_on_text_changed='never'
let g:ale_completion_enabled=1
let g:ale_fix_on_save=1

" Remove search highlight
nnoremap <Leader><space> :noh<cr>

set omnifunc=syntaxcomplete#Complete

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"""""""""""""""""""""""""""
" vimwiki configure
"""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Qsync//vimwiki/', 'nested_syntaxes': {'ruby': 'ruby', 'javascript': 'javascript', 'sh': 'sh', 'bash': 'bash'}}]
