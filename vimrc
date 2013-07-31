" This is standard pathogen and vim setup
set nocompatible
set mouse=a
set number
set backspace=indent,eol,start
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=2
set shell=/usr/bin/bash
call pathogen#infect() 
syntax on
filetype plugin indent on
filetype on

let g:pyflakes_use_quickfix = 0
" Here's the vimclojure stuff. You'll need to adjust the NailgunClient
" setting if you're on windows or have other problems.
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 0 
"let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"


" Paredit
let g:paredit_mode = 0
let g:instant_markdown_slow = 1

" colorscheme Mustang
" colorscheme summerfruit256

if &term =~ "xterm\\|rxvt-unicode-256color"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;gray\x7"
  silent !echo -ne "\033]12;gray\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif



if has("gui_running")
"	colorscheme summerfruit256
  colorscheme	sweyla466858
	highlight OverLength ctermbg=red ctermfg=white guibg=#FF99CC
	match OverLength /\%81v.\+/
        set guioptions-=m  "remove menu bar
        set guioptions-=T  "remove toolbar
        set guioptions-=r  "remove right-hand scroll bar
else
	colorscheme Mustang
endif

set guifont=Monaco\ for\ Powerline\ 9
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType html setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

let g:SuperTabDefaultCompletionType = "<c-p>"
set completeopt=menuone,longest,preview

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['haskell'] }


set foldmethod=indent
set foldlevel=99

let g:Powerline_symbols = 'fancy'
map <leader>g :GundoToggle<CR>
map <F12> :setlocal spell! spelllang=en_us<CR>
