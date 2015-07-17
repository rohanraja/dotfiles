"function! HelloVim()
"	
"	:w
"	:source ~/.vimrc
"	call HelloPython()
"
"endfunction

function! HelloPython()
python << endPython

import vim

print vim.current.buffer[:]

endPython
endfunction


nnoremap <Leader>f :call HelloVim()<CR>
