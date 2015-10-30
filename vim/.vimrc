" __ _(_)_ __
" \ V / | '  \
  "\_/|_|_|_|_|

"-------~---~----------~----------~----
" Vundle-related
"-------~---~----------~----------~----
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call vundle#end()


"-------~---~----------~----------~----
" Ctrl-P
"-------~---~----------~----------~----
set wildignore+=*/tmp/*,*.so,*.swp,*.zip              " OSX/Linux common ignores
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'          " Ignore .git/ folder
let g:ctrlp_custom_ignore = '\v[\/](static|static2|bower_components|node_modules|tmp)$'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0


"-------~---~----------~----------~----
" Syntax-related
"-------~---~----------~----------~----
let g:syntastic_html_tidy_ignore_errors=["lacks value", " proprietary attribute",
  \ "unescaped &", "trimming empty", "not recognized", "unexpected",
  \ "escaping malformed", "<body> elements", "implicit", "missing </ul>"]

" Remove coffeescript parsing which is accomplished by normal vim
hi link coffeeSpaceError NONE
hi link coffeeSemicolonError NONE
hi link coffeeReservedError NONE


"-------~---~----------~----------~----
" General Settings
"-------~---~----------~----------~----

set nocompatible            " Disable Vi-Mode compatibility

set shell=/bin/zsh

let mapleader = ","         " Leader ,
let g:mapleader = ","       " Leader ,

"match ErrorMsg '\%>80v.\+'  " Highlight over 80 characters
filetype plugin indent on   " Detect filetypes on file open

" Copy and paste
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<CR>

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

"-------~---~----------~----------~----
" Colors
"-------~---~----------~----------~----
syntax enable


set background=dark
let g:gruvbox_termcolors=16
let g:gruvbox_italic=0
"let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox


"-------~---~----------~----------~----
" UI Settings
"-------~---~----------~----------~----

set backspace=indent,eol,start  " Set backspace behavior to what's expected
set cindent                     " C-style indentation
set ignorecase                  " Case sensitive if capitals in search
set smartcase                   " Case sensitive if capitals in search
set incsearch                   " Incremental searching
set laststatus=2                " Always show status line
set list                        " Show trailing whitespace
"set lcs=tab:▒░,trail:▓
"set listchars=tab:\ \ ,...
set listchars=tab:\ \ ,trail:·,eol:\ ,nbsp:_
set cursorline                  " Background color on current cursor line
set lazyredraw                  " Don't redraw while executing macros
set ttyfast
set magic                       " For regular expressions turn magic on
set nohlsearch                  " Don't highlight search after <CR>
set noshowmode                  " Don't show --INSERT-- in status line
set number                      " Line numbers in the sidebar
set scrolloff=5                 " Scroll margin at top or bottom of screen
set synmaxcol=200
"set regexpengine=1
set timeoutlen=50

set nospell                     " Spell check slows us down

set noerrorbells                " No annoying sound on errors
set novisualbell                " No annoying sound on errors
set t_vb=                       " No annoying sound on errors
set tm=500                      " No annoying sound on errors
set noeb vb t_vb=               " No annoying sound on errors

"set mouse=nicr                  " Enable the mouse
set mouse=a                     " Enable the mouse

" Un-highlight shortcut if highlighting is enabled
nnoremap <silent> <C-l> :nohl<CR><C-l>


"-------~---~----------~----------~----
" Tabs / Buffers / Lines
"-------~---~----------~----------~----

set noexpandtab       " Use spaces instead of tabs
set smarttab        " Be smart when using tabs
set shiftwidth=2    " 2-space tabs
set softtabstop=2   " 2-space tabs
set tabstop=2       " 2-space tabs
set lbr             " Linebreak on 200 characters
set tw=200          " Linebreak on 200 characters
set ai              " Auto indent
set si              " Smart indent
set nowrap          " Wrap lines

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t. :tabnext<cr>
map <leader>t, :tabprevious<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%
" Remap VIM 0 to first non-blank character
map 0 ^
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"-------~---~----------~----------~----
" Files / Backups
"-------~---~----------~----------~----
" Backups and .swp files in their own folder instead of cwd
set backupdir=~/.vim-tmp/
set directory=~/.vim-tmp/

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Wrap lines in mutt editing
au BufRead /tmp/mutt-* set tw=72

" .md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" only run JSHint on file write
let JSHintUpdateWriteOnly=1

" Wrap lines in git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72


"-------~---~----------~----------~----
" Fugitive
"-------~---~----------~----------~----
map <leader>gs :Gstatus<cr>
map <leader>ge :Gedit<cr>
map <leader>gc :Gcommit<cr>
map <leader>gg :Ag<Space>
"autocmd QuickFixCmdPost *grep* cwindow


"-------~---~----------~----------~----
" NERDTree
"-------~---~----------~----------~----
autocmd VimEnter * wincmd p
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
nmap <Leader>n :NERDTreeToggle<CR><C-l>
let g:indent_guides_exclude_filetypes = ['nerdtree']
hi Directory ctermfg=blue

"-------~---~----------~----------~----
" Vim-Test
"-------~---~----------~----------~----

map <leader>T :Dispatch make test<cr>
map <leader>C :Dispatch make coverage<cr>


"-------~---~----------~----------~----
" GUI Settings
"-------~---~----------~----------~----
if has("gui_running")
	colorscheme hybrid
  set antialias
  set vb t_vb=
  set guifont=Inconsolata\ for\ Powerline:h14
  set antialias
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set nospell
  set linespace=1
  set noerrorbells                " No annoying sound on errors
  set novisualbell                " No annoying sound on errors
  set t_vb=                       " No annoying sound on errors
  set tm=500                      " No annoying sound on errors
  set noeb vb t_vb=               " No annoying sound on errors
endif
set vb t_vb=
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set nospell
set noerrorbells                " No annoying sound on errors
set novisualbell                " No annoying sound on errors
set t_vb=                       " No annoying sound on errors
set tm=500                      " No annoying sound on errors
set noeb vb t_vb=               " No annoying sound on errors


"-------~---~----------~----------~----
" Airline
"-------~---~----------~----------~----
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif

" symbols
"let g:airline_left_sep = '>'
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = '>'
"let g:airline_right_alt_sep = ''

"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

let g:airline_theme="base16"
let g:airline_powerline_fonts = 1


function! HasConfig(file, dir)
    return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

autocmd BufNewFile,BufReadPre *.js  let b:syntastic_checkers =
    \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
    \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
    \     ['standard']


