map! <buffer> <F5> <Esc>:w<CR>:!go run % <CR>
map <buffer> <F5> <Esc>:w<CR>:!go run % <CR>

map! <buffer> <F6> <Esc>:w<CR>:!go fmt %<CR>:e %<CR>
map <buffer> <F6> <Esc>:w<CR>:!go fmt %<CR>:e %<CR>
set noexpandtab

cnoreabbrev w :w<CR>:!go fmt %<CR>:e %<CR><CR> 
cnoreabbrev wq :w<CR>:!go fmt %<CR>:q<CR>
