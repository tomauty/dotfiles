set rtp+=/usr/local/go/misc/vim

""""""""""""""""""""
" Vundle
""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call vundle#end()


""""""""""""""""""""
" NERDTree
""""""""""""""""""""
autocmd VimEnter * wincmd p
let NERDTreeShowLineNumbers=0
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr', '\.DS_Store']
let NERDTreeWinSize=30


""""""""""""""""""""
" Ctrl-P
""""""""""""""""""""
" OSX/Linux common ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Ignore .git/ folder in cwd
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'

" Ignore common JS project folders
let g:ctrlp_custom_ignore = '\v[\/](static|static2|bower_components|node_modules|tmp)$'

" Enable additional ctrl-P modes
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']


""""""""""""""""""""
" Syntastic
""""""""""""""""""""
" AngularJS handler for syntastic until it's supported properly
let g:syntastic_html_tidy_ignore_errors=["lacks value", " proprietary attribute",
  \ "unescaped &", "trimming empty", "not recognized", "unexpected",
  \ "escaping malformed", "<body> elements", "implicit", "missing </ul>"]


""""""""""""""""""""
" General
""""""""""""""""""""
" Disable Vi-Mode compatibility
set nocompatible

" Detect filetypes on file open
filetype plugin indent on

" <leader> === comma key
let mapleader = ","
let g:mapleader = ","

" No need to slow down
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" NERDTree shortcut
nmap <Leader>n :NERDTree<CR><C-l>

" Fast saving / closing
nmap <leader>w :w!<cr>
nmap <Leader>q :q!<CR>
nmap <Leader>x :x<CR>


""""""""""""""""""""
" Colors
""""""""""""""""""""
" Enable syntax highlighting
syntax enable

if $TERM == "xterm-256color" || $TERM == "screen-256color"
  set t_Co=256
endif

" gruvbox
let g:gruvbox_italic=0

" seoul256 (dark):
" range:   233 (darkest) ~ 239 (lightest)
" default: 237
let g:seoul256_background = 233

" bg
set background=dark

" color scheme
colorscheme base16-default

" Grey line at 100 characters
set colorcolumn=100


""""""""""""""""""""
" User Interface
""""""""""""""""""""
" Set backspace behavior to what's expected intuitively
set backspace=indent,eol,start

" C-style indentation. Indents according to C-standard
set cindent

" Searches become case-sensitive if you add capital letters to the search
set ignorecase
set smartcase

" Incremental searching
set incsearch

" Always show status line
set laststatus=2

" Show trailing whitespace
set list
set listchars=tab:▸\ ,trail:▫

" Background color on current cursor line
set cursorline

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Don't highlight search after <CR>
set nohlsearch

" Don't show --INSERT-- in status line (powerline compatibility)
set noshowmode

" Line numbers in the sidebar
set number

" 5 line scrolling margin at top or bottom of screen
set scrolloff=5

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Un-highlight shortcut if highlighting is enabled
nnoremap <silent> <C-l> :nohl<CR><C-l>

" GUI-specific options
if has("gui_running")
    " Hide right scrollbar
    set guioptions-=r

    " Hide left scrollbar
    set guioptions-=L

    " Hide GUI tabs
    set guioptions-=e

    " Ensure colorcolumn displays in correct color
    highlight ColorColumn guibg=#333333
endif

""""""""""""""""""""
" Tabs/Buffers/Lines
""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Linebreak on 200 characters
set lbr
set tw=200

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

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


""""""""""""""""""""
" Files + Backups
""""""""""""""""""""
" Backups and .swp files in their own folder instead of cwd
set backupdir=~/.vim-tmp/
set directory=~/.vim-tmp/

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" .md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" j and k mash escape
inoremap jk <Esc>
inoremap kj <Esc>

" only run JSHint on file write
let JSHintUpdateWriteOnly=1

au BufRead,BufNewFile *.go set filetype=go
set mouse=nicr
set mouse=a

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0


""""""""""""""""""""
" Fugitive mappings
""""""""""""""""""""
map <leader>gs :Gstatus<cr>
map <leader>ge :Gedit<cr>
map <leader>gc :Gcommit<cr>
map <leader>gg :Ggrep
autocmd QuickFixCmdPost *grep* cwindow


""""""""""""""""""""
" Airline
""""""""""""""""""""
let g:airline_powerline_fonts = 1
