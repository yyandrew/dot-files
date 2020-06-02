set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Surround your code :)
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-rails'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
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
" Plugin 'majutsushi/tagbar'
Plugin 'rhysd/git-messenger.vim'
Plugin 'tpope/vim-repeat'
" Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'Quramy/tsuquyomi'
Plugin 'vimwiki/vimwiki'
Plugin 'dart-lang/dart-vim-plugin'
" Plugin 'zxqfl/tabnine-vim'
Plugin 'tpope/vim-endwise'
Plugin 'danchoi/ri.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'kana/vim-textobj-user'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'wlemuel/vim-tldr'
Plugin 'Shougo/vimproc.vim'
" colorscheme
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'

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
" airline configure
"""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""
" easytags configuration
"""""""""""""""""""""""""""
:set tags=./tags;
:let g:easytags_dynamic_files = 1

"""""""""""""""""""""""""""
" indentLine configure
"""""""""""""""""""""""""""
" enable indentLine
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1
" Specify how much indent level do you want to use for(default is 10)
let g:indentLine_indentLevel = 20

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

"""""""""""""""""""""""""""
" fugitive config
"""""""""""""""""""""""""""
autocmd BufReadPost fugitive://* set bufhidden=delete

"""""""""""""""""""""""""""
" gitgutter config
"""""""""""""""""""""""""""
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
let g:gitgutter_preview_win_floating = 1

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
colorscheme gruvbox
" set linenumber color to be dark grey
highlight LineNr ctermfg=DarkGrey

"""""""""""""""""""""""""""
" vim-better-whitespace configure
"""""""""""""""""""""""""""
nmap ,w :StripWhitespace<CR>

"""""""""""""""""""""""""""
" w0rp/ale configure
"""""""""""""""""""""""""""
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'tsx': ['prettier', 'eslint'],
\   'ruby': ['prettier'],
\}
let g:ale_lint_on_text_changed='never'
let g:ale_completion_enabled=1
let g:ale_fix_on_save=0

" Remove search highlight
nnoremap <Leader><space> :noh<cr>

set omnifunc=syntaxcomplete#Complete

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"""""""""""""""""""""""""""
" vimwiki configure
"""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Qsync//vimwiki/', 'nested_syntaxes': {'ruby': 'ruby', 'javascript': 'javascript', 'sh': 'sh', 'bash': 'bash'}}]

"""""""""""""""""""""""""""
" ack configure
"""""""""""""""""""""""""""
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" let g:ackprg = 'ag --nogroup --nocolor --column'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1


let &t_SI = "\e[3 q"
let &t_EI = "\e[2 q"

"""""""""""""""""""""""""""
" optional reset cursor on start:
"""""""""""""""""""""""""""
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"""""""""""""""""""""""""""
" multiple cursor configure
"""""""""""""""""""""""""""
let g:multi_cursor_select_all_word_key = '<Leader>m'
" nnoremap <Leader>m :multi_cursor_select_all_word_key
set re=1
" let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""
" textobj configuration
"""""""""""""""""""""""""""
call textobj#user#plugin('ruby', {
\   'doend': {
\     'pattern': ['do', 'end'],
\     'select-a': 'ad',
\     'select-i': 'id',
\   },
\   'itend': {
\     'pattern': ['it', 'end'],
\     'select-a': 'ai',
\     'select-i': 'ii',
\   },
\ })

"""""""""""""""""""""""""""
" fzf-vim
"""""""""""""""""""""""""""
" Ctrl + p open Git files
nmap <C-p> :GFiles --cached --others --exclude-standard<CR>
" Ctrl + e open buffers
nmap <C-e> :Buffers<CR>
" Press Ctrl + e twice to open previous Buffer
let g:fzf_action = { 'ctrl-e': 'edit' }
if has('nvim')
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit' }

"""""""""""""""""""""""""""
" tldr
"""""""""""""""""""""""""""
let g:tldr_directory_path = '~/.cache/tldr'
let g:tldr_language = 'zh'
