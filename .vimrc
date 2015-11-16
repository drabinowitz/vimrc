let mapleader = ","
execute pathogen#infect()
syntax on
syntax enable
filetype plugin indent on

set wildmenu
set lazyredraw

set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap <leader>u :GundoToggle<CR>

nnoremap <leader>s :mksession<CR>

nnoremap <leader>a :Ag<space>

set tabstop=2 shiftwidth=2 expandtab
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

set list listchars=trail:.,extends:>
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
let g:airline#extensions#tabline#enabled = 1

set colorcolumn=81

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_quiet_messages = {"regex": "\\(.*csv is deprecated.*\\|.*cannot find package.*\\|.*Transforming source messes up.*\\|.*Comprehensions must have parentheses.*\\|.*NameError: variable @.*\\)"}
let g:syntastic_coffee_coffeelint_args = "--csv --reporter csv --file ~/coffeelint.json"
let g:syntastic_javascript_checkers = ['eslint']

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50,results:50'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_working_path_mode = 'a'

set wildignore+=*/node_modules/*,*.swp,*.pyc,*/build/*,*/target/*,*/_vendor/*

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:easytags_async = 1
let g:easytags_syntax_keyword = 'always'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:jsx_ext_required = 0

let g:vim_markdown_folding_disabled=1
let g:go_fmt_fail_silently = 1

let g:syntastic_bash_checkers=['']

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set list
set listchars=tab:\ \_

set shell=bash

nnoremap <leader>j <Char-23>w
nnoremap <leader>k <Char-23>W
nnoremap <leader>s <Char-23><Char-19>
nnoremap <leader>v <Char-23><Char-22>

nnoremap <leader>eq <Char-58>Tab<Char-47><Char-61><CR>
nnoremap <leader><Char-58> <Char-58>Tab<Char-47><Char-58><Char-92>zs<CR>
vnoremap <leader>eq <Char-58>Tab<Char-47><Char-61><CR>
vnoremap <leader><Char-58> <Char-58>Tab<Char-47><Char-58><Char-92>zs<CR>
