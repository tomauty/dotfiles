" __ _(_)_ __
" \ V / | '  \
  "\_/|_|_|_|_|

"-------~---~----------~----------~----
" Vundle-related
"-------~---~----------~----------~----
let $PYTHONPATH="/usr/lib/python3.4/site-packages"
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
" Syntastic
"-------~---~----------~----------~----
let g:syntastic_html_tidy_ignore_errors=["lacks value", " proprietary attribute",
  \ "unescaped &", "trimming empty", "not recognized", "unexpected",
  \ "escaping malformed", "<body> elements", "implicit", "missing </ul>"]


"-------~---~----------~----------~----
" General Settings
"-------~---~----------~----------~----

set nocompatible            " Disable Vi-Mode compatibility

let mapleader = ","         " Leader ,
let g:mapleader = ","       " Leader ,

match ErrorMsg '\%>80v.\+'  " Highlight over 80 characters
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


"-------~---~----------~----------~----
" Colors
"-------~---~----------~----------~----
syntax enable

if $TERM == "xterm-256color" || $TERM == "screen-256color"
  set t_Co=256
endif

let g:gruvbox_italic=0
let g:gruvbox_termcolors=16
set background=dark
let g:gruvbox_contrast_dark="hard"

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
set listchars=tab:▸\ ,trail:▫   " Show trailing whitespace
set cursorline                  " Background color on current cursor line
set lazyredraw                  " Don't redraw while executing macros
set magic                       " For regular expressions turn magic on
set nohlsearch                  " Don't highlight search after <CR>
set noshowmode                  " Don't show --INSERT-- in status line
set number                      " Line numbers in the sidebar
set scrolloff=5                 " Scroll margin at top or bottom of screen

set noerrorbells                " No annoying sound on errors
set novisualbell                " No annoying sound on errors
set t_vb=                       " No annoying sound on errors
set tm=500                      " No annoying sound on errors
set noeb vb t_vb=               " No annoying sound on errors

set mouse=nicr                  " Enable the mouse
set mouse=a                     " Enable the mouse

" Un-highlight shortcut if highlighting is enabled
nnoremap <silent> <C-l> :nohl<CR><C-l>


"-------~---~----------~----------~----
" Tabs / Buffers / Lines
"-------~---~----------~----------~----

set expandtab       " Use spaces instead of tabs
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
let JSHintUpdateWriteOnly=0

" Wrap lines in git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72


"-------~---~----------~----------~----
" Fugitive
"-------~---~----------~----------~----
map <leader>gs :Gstatus<cr>
map <leader>ge :Gedit<cr>
map <leader>gc :Gcommit<cr>
map <leader>gg :Ggrep
autocmd QuickFixCmdPost *grep* cwindow


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


"-------~---~----------~----------~----
" Airline
"-------~---~----------~----------~----
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme="base16"

