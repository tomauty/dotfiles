""""""""""""""""""""
" Vundle
""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


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
  \ "escaping malformed"]


""""""""""""""""""""
" Powerline
""""""""""""""""""""
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'base16'

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

""""""""""""""""""""
" Colors
""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme base16-default
set background=dark

" Grey line at 100 characters
set colorcolumn=100


""""""""""""""""""""
" User Interface
""""""""""""""""""""
" Set backspace behavior to what's expected intuitively
set backspace=indent,eol,start

" C-style indentation. Indents according to C-standard
set cindent

" Hitting <Tab> in INSERT will add some spaces
set expandtab

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

" Don't highlight search after <CR>
set nohlsearch

" Don't show --INSERT-- in status line (powerline compatibility)
set noshowmode

" Line numbers in the sidebar
set number

" 5 line scrolling margin at top or bottom of screen
set scrolloff=5

" 2 space tab in normal mode
set shiftwidth=2

" Tab uses spaces
set softtabstop=2

" Tab counts for 2 columns
set tabstop=2

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

