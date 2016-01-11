"    ______)           _____
"   (, /              (, /  |
"     /   ______        /---|     _/_
"  ) /   (_) // (_   ) /    |_(_(_(__(_/_
" (_/               (_/               /
"                                  (_/

"-------~---~----------~----------~----
" Pathogen/PATH
"-------~---~----------~----------~----
let $PATH="/Users/tom/.nvm/versions/node/v4.2.1/bin:" . $PATH
execute pathogen#infect()
syntax on
filetype plugin indent on


"-------~---~----------~----------~----
" Swap/temporary file handling
"-------~---~----------~----------~----
set backupdir=~/.vim-tmp/
set directory=~/.vim-tmp/


"-------~---~----------~----------~----
" Command Overrides
"-------~---~----------~----------~----
let mapleader=","

" Easy quit, no errors
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
nmap <leader>w :w!<cr>
nmap <Leader>q :q!<CR>
nmap <Leader>x :x<CR>

" j and k mash escape
inoremap jk <Esc>
inoremap kj <Esc>

" Stop command line window
map q: :q

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

"-------~---~----------~----------~----
" NERDTree
"-------~---~----------~----------~----
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeChDirMode=0
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr', '\.DS_Store']
let NERDTreeMouseMode=2
let NERDTreeQuitOnOpen=0
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinPos="left"
let NERDTreeWinSize=25
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1
let g:indent_guides_exclude_filetypes = ['nerdtree']


"-------~---~----------~----------~----
" Ctrl-P
"-------~---~----------~----------~----
let g:ctrlp_by_filename=0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:5,results:5'
let g:ctrlp_show_hidden = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'
let g:ctrlp_custom_ignore = '\v[\/](static|static2|bower_components|node_modules|tmp)$'
let g:ctrlp_mruf_relative = 1


"-------~---~----------~----------~----
" Colors
"-------~---~----------~----------~----
set background=dark
colorscheme hybrid_reverse

"-------~---~----------~----------~----
" GUI Settings
"-------~---~----------~----------~----
if has("gui_running")
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions-=e
  set guifont=Droid\ Sans\ Mono:h14
	set linespace=5
endif

set cursorline
set incsearch
set ignorecase
set smartcase
set nohlsearch
set number

set noexpandtab     " Use tabs
set smarttab        " Be smart when using tabs
set shiftwidth=2    " 2-space tabs
set softtabstop=2   " 2-space tabs
set tabstop=2       " 2-space tabs
set lbr             " Linebreak on 200 characters
set tw=200          " Linebreak on 200 characters
set ai              " Auto indent
set si              " Smart indent
set nowrap          " Wrap lines


"-------~---~----------~----------~----
" Filetype specific spacing rules
"-------~---~----------~----------~----
autocmd BufNewFile,BufReadPost *.vimrc  setl shiftwidth=2 expandtab 	" This file
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab 	" Coffeescript


"-------~---~----------~----------~----
" Project rules
"-------~---~----------~----------~----
function! SetupEnvironment()
  let l:path = expand('%:p')
  " MoneyLion AngularJS project uses tabs
  if l:path =~ '/Users/tom/MoneyLion'
    setlocal tabstop=2 shiftwidth=2 noexpandtab
  endif
  if l:path =~ '/Users/tom/MoneyLion/mlsocialapi'
    setlocal tabstop=2 shiftwidth=2 expandtab
  endif
  " iOS app uses react in all JS files
  if l:path =~ '/Users/tom/MoneyLion/MoneyLion'
    " TODO: figure out how to conditionally allow jsx project-wide
    setlocal tabstop=2 shiftwidth=2 expandtab
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

let g:jsx_ext_required = 0

"-------~---~----------~----------~----
" Convenient Functions
"-------~---~----------~----------~----
autocmd BufWritePre * :%s/\s\+$//e      " Remove whitespace on save
autocmd QuickFixCmdPost *grep* cwindow  " Auto quickfix from grep

"-------~---~----------~----------~----
" Airline
"-------~---~----------~----------~----
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='hybrid'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 1

"-------~---~----------~----------~----
" Syntastic
"-------~---~----------~----------~----
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_html_tidy_ignore_errors = [ 'proprietary attribute', 'trimming empty' ]





"-------~---~----------~----------~----
" Misc. Vimrcs
"-------~---~----------~----------~----
so ~/.startify.vimrc
