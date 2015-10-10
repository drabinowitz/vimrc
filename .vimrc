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

nnoremap <leader>u :GundleToggle<CR>

nnoremap <leader>s :mksession<CR>

nnoremap <leader>a :Ag

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

set wildignore+=*/node_modules/*,*.swp,*.pyc,*/build/*,*/target/*,*/_vendor/*
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

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
