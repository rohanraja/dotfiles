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

"
" Plugin 'LucHermitte/lh-vim-lib'
" Plugin 'LucHermitte/lh-tags'
" Plugin 'LucHermitte/lh-dev'
" Plugin 'LucHermitte/lh-brackets'
" Plugin 'LucHermitte/vim-refactor'

Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-cucumber'
" Plugin 'kshenoy/vim-signature'
Plugin 'kien/ctrlp.vim'
" Plugin 'Valloric/YouCompleteMe'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
" plugin 'valloric/youcompleteme'


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
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'itchyny/calendar.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

Plugin 'mattn/emmet-vim'
Plugin 'skywind3000/asyncrun.vim'

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
" let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
" let g:UltiSnipsSnippetDirectories  = ["UltiSnips"]

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

" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

nnoremap zz zt


"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
    
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
" set clipboard+=unnamed  " Yanks go on clipboard instead.
set timeoutlen=200

set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.


let g:ackprg = 'ack'
let $PATH .= ':/usr/local/bin/'

set tags=./tags;
let g:ycm_collect_identifiers_from_tags_files = 1

" Show file name as the window title in tmux
" autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
" autocmd VimLeave * call system("tmux rename-window bash")

" Move lines up and down easily
"map KK :m -2<CR>
"map JJ :m +1<CR>
nnoremap JJ :m .+1<CR>==
nnoremap KK :m .-2<CR>==
inoremap JJ <Esc>:m .+1<CR>==gi
inoremap KK <Esc>:m .-2<CR>==gi
vnoremap JJ :m '>+1<CR>gv=gv
vnoremap KK :m '<-2<CR>gv=gv

" Page up and down with SHIFT+Arrow keys
map <S-Up> <C-u>
map <S-Down> <C-d>

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
        " return "\<c-x>\<c-o>"
        return "\<c-p>"
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
map <leader>l :w<cr> :Silent chrome-cli reload<cr> 
" map <leader>l :w<cr> :Silent open /Applications/Google\ Chrome.app/<cr>:Silent chrome-cli reload<cr> 

cabbr <expr> %% expand('%:p:h')

" Increment/Decrement digit under the cursor
noremap <Leader>i a <ESC>h<C-a>lxh
noremap <Leader>de a <ESC>h<C-x>lxh
nnoremap <C-y> :CtrlPTag<cr>

" Goto tag and bring cursor to the top of the screen
nnoremap <C-f> <C-]>zt
nnoremap <C-v> *


" Cycle buffers
" Todo: Show list of recent buffers while cycling
nnoremap <C-o> :bnext<CR>
nnoremap <C-i> :bprevious<CR>

" Copy current buffer to verticle split
nnoremap <leader>v :vertical sb<CR>

set ttyfast

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Search for word under cursor in all files
nnoremap L :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Relative line numbers
" set relativenumber

" detect when a file is changed
set autoread 

" remap esc
inoremap jk <esc>

" set paste toggle
map <leader>v :set paste!<cr>

" adjust screen upon match
map n nzz
map N Nzz


" Rails test 
au FileType rb map <Leader>t :call RunCurrentSpecFile()<CR>
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Run last command in a Tmux pane - Good for testing 
map <Leader>tt :w<CR> :call Send_to_Tmux("!!\n\n")<CR>

" Quick go to command mode
nnoremap ; :

au BufRead,BufNewFile *.go setlocal filetype=go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go map <leader>t :GoTest<CR>
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>d <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" ##########################################################################################################################################################
au FileType go map <Leader>tt :call Send_to_Tmux("c\ngo test\n")<CR>
" ##########################################################################################################################################################

" ##########################################################################################################################################################
" TagBar Plugin Toggle
map <Leader>tb :TagbarToggle<CR>
" ##########################################################################################################################################################


" ##########################################################################################################################################################
"Cursor Line Settings
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE
"guibg=darkred guifg=white
set cursorline
" ##########################################################################################################################################################


" ##########################################################################################################################################################
" Select All
map VV gg0vG$
" ##########################################################################################################################################################


:imap <C-b> <Plug>snipMateTrigger

" Ctags 
noremap <Leader>ct :!ctags -R .<CR>

let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" ##########################################################################################################################################################

map <Leader>de Oimport ipdb; ipdb.set_trace()jk

nnoremap <Leader>rt :Pytest method<CR>
nnoremap <Leader>rtt :Pytest class<CR>

" ##########################################################################################################################################################

" Quick run via <F5>
nnoremap <Leader>rr :call <SID>compile_and_run()<CR>

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction


" ##########################################################################################################################################################

let b:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_warning = '--'
highlight clear ALEWarningSign

au BufRead,BufNewFile *.thor set filetype=ruby


vmap \em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name = inputdialog("Name of new method:")
  '<
  exe "normal! O\<BS>private " . name ."()\<CR>{\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>}\<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal! kf(
  exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
  normal! ==
  normal! j0w
endfunction

command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
