:inoremap <c-s> <c-o>:w<CR>
:nnoremap <c-s> <Esc>:w<CR>
:map <D-s> :w<kEnter>  "Works in normal mode, must press Esc first"
:imap <D-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
:nnoremap <Leader>w :w<CR>
:nnoremap <Leader>q :q<CR>
