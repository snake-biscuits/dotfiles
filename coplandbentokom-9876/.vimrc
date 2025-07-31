execute pathogen#infect()
filetype plugin indent on

" tabs & counters
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number ruler autoindent

" colour palette
set termguicolors background=dark
syntax on
colorscheme gruvbox

" airline settings
let g:airline_theme = "base16_gruvbox_dark_hard"
let g:airline#extensions#battery#enabled = 1
" still isn't working; idk why

" run current python file
au filetype python nnoremap <F5> :w<cr>:!clear<cr>:exec '!python3 %'<cr>
" compile and run current c file
au filetype c nnoremap <F5> :w<cr>:!clear<cr>:exec '!gcc % -o %:r && ./%:r'<cr>
" TODO: make run hotkey

" ale defaults
let g:ale_python_flake8_options = "--max-line-length=127"
let g:ale_c_parse_makefile = 1
"let g:ale_linters = {"cpp": ["g++"]}
"let g:ale_linters_explicit = 1
"let g:ale_linters_ignore = {"cpp": ["gcc", "clang", "clang++"]}
let g:ale_cpp_cc_executable = "g++"

" register squirrel syntax
au BufNewFile,BufRead *.nut setf squirrel
au BufNewFile,BufRead *.gnut setf squirrel

" register kaitai struct syntax
au BufNewFile,BufRead *.ksy setf yaml

" 2 wide tabs for web formats
au filetype css,html,javascript set shiftwidth=2
au filetype typescript set shiftwidth=2
