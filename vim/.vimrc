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
Plugin 'rhysd/git-messenger.vim'
Plugin 'tpope/vim-repeat'
" Plugin 'mxw/vim-jsx'
" Plugin 'Quramy/tsuquyomi'
Plugin 'dart-lang/dart-vim-plugin'
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
Plugin 'neoclide/coc.nvim'
Plugin 'Shougo/echodoc.vim'
" Plugin 'vim-scripts/YankRing.vim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'tpope/vim-abolish'
Plugin 'kkoomen/vim-doge'

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
nmap ,r :RuboCop -a<CR>

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
set background=dark
" set linenumber color to be dark grey
highlight LineNr ctermfg=DarkGrey

"""""""""""""""""""""""""""
" vim-better-whitespace configure
"""""""""""""""""""""""""""
nmap ,w :StripWhitespace<CR>


" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <Leader> f :ALEFix<CR>

" Remove search highlight
nnoremap <Leader><space> :noh<CR>

"""""""""""""""""""""""""""
" Omni completion
"""""""""""""""""""""""""""
" Provides smart autocompletion for programs
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,noinsert

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

"""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_doc_popup_window = 1
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>d <Plug>(go-describe)
au FileType go nmap <leader>r <Plug>(go-run)

"""""""""""""""""""""""""""
" typescript-vim
"""""""""""""""""""""""""""
let g:typescript_indent_disable = 1

"""""""""""""""""""""""""""
" ctags
"""""""""""""""""""""""""""
nmap ,c :!ctags %<CR>
" Press Ctrl + i to open tags selector

" Add LanguageClient-neovim plugin to vim/neovim runtimepath
" set runtimepath+=~/.vim-plugins/LanguageClient-neovim
" nnoremap <silent> ,K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" let g:LanguageClient_serverCommands = {
  " \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
  " \ }
" echodoc configuration
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu
" coc-prettier configuration
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-eslint configuration
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix

" go to difinition
nmap <silent> gd <Plug>(coc-definition)
" coc error
nmap <silent> <C-k> <Plug>(coc-diagnostic-next-error)
nmap <silent> <C-K> <Plug>(coc-diagnostic-next)
" Hide float window after the <C-c>
inoremap <C-c> <ESC>
