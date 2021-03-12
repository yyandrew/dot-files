" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'xolox/vim-misc'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
" Surround your code :)
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-rails'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-bundler'
Plug 'jiangmiao/auto-pairs'
Plug 'ngmy/vim-rubocop'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mattn/emmet-vim'
Plug 'thoughtbot/vim-rspec'
Plug 'fatih/vim-go'
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'slim-template/vim-slim'
" Plug 'majutsushi/tagbar'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-repeat'
" Plug 'mxw/vim-jsx'
" Plug 'Quramy/tsuquyomi'
" Plug 'vimwiki/vimwiki'
Plug 'dart-lang/dart-vim-plugin'
" Plug 'zxqfl/tabnine-vim'
Plug 'tpope/vim-endwise'
Plug 'danchoi/ri.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'kana/vim-textobj-user'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wlemuel/vim-tldr'
Plug 'Shougo/vimproc.vim'
" colorscheme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/echodoc.vim'
" Plug 'vim-scripts/YankRing.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-abolish'
Plug 'kkoomen/vim-doge'

call plug#end()
filetype plugin indent on    " required

"""""""""""""""""""""""""""
" put your custom stuff here
"""""""""""""""""""""""""""
set cursorline "设置光标所在行显示横线
set number " 显示行号
set hlsearch " 高亮查询结果
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*,*/app/assets/images/*,*/node_modules/* " Exclude files and directories
" convert tabs to spaces
set expandtab
set shiftwidth=2
set softtabstop=2
" switch between case sensitive and insensitive search
nmap <F9> :set ignorecase! ignorecase?<CR>
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
" buffer configure
"""""""""""""""""""""""""""
map  <C-l> :bn<CR>
map  <C-h> :bp<CR>
map  <C-x> :bd<CR>
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
" netrw configure
"""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_winsize = 30
" F2 open/close netrw
map <F2> :Lexplore<CR>
" Reveal file in tree
nmap ,f :Lexplore %:p:h<CR>

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
let g:rspec_command = '!bundle exec rspec {spec}'
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
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
let g:gitgutter_preview_win_floating = 1

"""""""""""""""""""""""""""
" Set path for find command
"""""""""""""""""""""""""""
set path=$PWD/**

"""""""""""""""""""""""""""
" gruvbox configure
"""""""""""""""""""""""""""
set termguicolors
set background=dark
let ayucolor="mirage"
colorscheme ayu
" set linenumber color to be dark grey
" highlight LineNr ctermfg=DarkGrey

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
nnoremap <Leader>a<space> :Ack!<Space>
nnoremap <Leader>ac :Ack!<Space><cword>
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
\   'defend': {
\     'pattern': ['def', 'end'],
\     'select-a': 'af',
\     'select-i': 'if',
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

noremap <leader>f :CocCommand prettier.formatFile<CR>
vnoremap <leader>f <Plug>(coc-format-selected)

" coc-eslint configuration
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix

" go to difinition
nmap <silent> gd <Plug>(coc-definition)
" coc error
nmap <silent> <C-k> <Plug>(coc-diagnostic-next-error)
nmap <silent> <C-K> <Plug>(coc-diagnostic-next)
" Hide float window after the <C-c>
inoremap <C-c> <ESC>

" netrw configuration
" let g:netrw_winsize = 25
" let g:netrw_altv=1
"
" snipmate configuration
let g:snipMate = { 'snippet_version' : 1 }
nnoremap <leader>class :-1read $HOME/.vim/.skeleton.rb<CR>A
" Edit vimrc
nnoremap <Leader>! :source ~/.vimrc<CR>
" Reload vimrc
nnoremap <Leader>e :vsplit ~/.vimrc<CR>

" Enable spell check
nnoremap <Leader>c :setlocal spell spelllang=en_us<CR>
" Disable spell check
nnoremap <Leader>C :setlocal nospell<CR>

" 输入q@，之后按<space>自动转换成andrew@ekohe.com
iabbrev q@ qqerqqer@126.com

autocmd BufNewFile, BufRead .git/COMMIT_EDITMSG setlocal spell spelllang=en_us

" add delete method
onoremap m :normal! ?^def<cr>:nohlsearch<cr>kV/end<cr>
