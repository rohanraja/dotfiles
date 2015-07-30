set splitbelow
set splitright
set laststatus=2 
set number
set noswapfile
set wildmode=longest,list
set wildmenu
set path=$PWD/**
"set autochdir
set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set background=dark



" set the runtime path to include Vundle and initialize
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'davidhalter/jedi-vim'
" Plugin 'kshenoy/vim-signature'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'powerline/powerline'
Plugin 'janko-m/vim-test'
Plugin 'alfredodeza/pytest.vim'
Plugin 'sjl/gundo.vim'
Plugin 'wincent/terminus'
Plugin 'tpope/vim-rails'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tmhedberg/matchit'
Plugin 'vim-scripts/project.tar.gz'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'itchyny/calendar.vim'

"Plugin 'bling/vim-airline'
" Plugin 'rkulla/pydiction'

" plugin from http://vim-scripts.org/vim/scripts.html

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
let mapleader=" "
nnoremap <leader>sop :source ~/.vimrc<cr>
nnoremap <leader>vun :source ~/.vimrc<cr>:VundleInstall<cr>

for fpath in split(globpath('~/.vim/plugin', '*.vim'), '\n')
  exe 'source' fpath
endfor

if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let g:UltiSnipsExpandTrigger = '<C-z>'   " terminals send C-@ when C-Space is pressed.
let g:UltiSnipsJumpForwardTrigger = '<C-l>' " some key I do not use at all

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories  = ["UltiSnips"]

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        call UltiSnips#JumpForwards()
        if g:ulti_jump_forwards_res == 0
           return ""  " nothing more to do
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

nnoremap zz zt


python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
    
set laststatus=2

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
set termencoding=utf-8

set t_Co=256
" Tap double space to easily switch to last buffer
nnoremap <leader><Space> <c-^>

" Easily open file browser sidebar
nnoremap <leader>nt :NERDTreeToggle<cr>


" Easily open vimrc config file
nnoremap <leader>rc :e ~/.vimrc<cr>


" Important Notes' Shortcuts
nnoremap <leader>rem :Note reminder<cr>
nnoremap <leader>tod :Note todo<cr>
nnoremap <leader>task :Note time table<cr>



set nocursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred


" set grepprg=ack

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set timeoutlen=250

set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.


let g:ackprg = 'ack'
let $PATH .= ':/usr/local/bin/'

set tags=./tags;
let g:ycm_collect_identifiers_from_tags_files = 1

" Show file name as the window title in tmux
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")

" Move lines up and down easily
map <S-k> :m -2<CR>
map <S-j> :m +1<CR>

" Page up and down with SHIFT+Arrow keys
map <S-Up> <PageUp>
map <S-Down> <PageDown>

map <leader>rak :Rake<CR>

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-p>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
map <leader>re :e!<cr>

command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" Reload in chrome
map <leader>l :w<cr> :Silent open /Applications/Google\ Chrome.app/<cr>:Silent chrome-cli reload<cr> 

cabbr <expr> %% expand('%:p:h')

" Increment/Decrement digit under the cursor
noremap <C-b> a <ESC>h<C-a>lxh
noremap <C-v> a <ESC>h<C-x>lxh
