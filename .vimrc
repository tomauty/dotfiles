" no-op, no vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" Vundle settings
filetype off
set rtp+=/Users/merlin/.vim/bundle/vundle/
call vundle#rc()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set backspace=indent,eol,start          " sets backspace behavior to what's expected intuitively
set backupdir=/Users/merlin/.vim-tmp/      " backups in their own folder
set cindent                             " c-style indentation. Indents according to C-standard
set directory=/Users/merlin/.vim-tmp/      " .swp in their own folder
set expandtab                           " hitting <Tab> in INSERT will add some spaces
set ignorecase                          " searches are not case-sensitive
set incsearch                           " incremental searching
set laststatus=2                        " always show status line
set list                                " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set cursorline                        " Some cs enable this by default
set nohlsearch                          " don't highlight search AFTER hitting return
set noshowmode                          " don't show --INSERT-- in status line (powerline compat.)
set number                              " line numbers on the sidebar
set scrolloff=5                         " 5 line scrolling margin at top or bottom of screen
set shiftwidth=2                        " 2 space tab in normal mode
set smartcase                           " searches become case-sensitive if you add capital letters
set softtabstop=2                       " tab uses spaces
set tabstop=2                           " tab counts for 2 columns

let g:gruvbox_italic=0

" Keyboard shortcuts
let mapleader = ","
inoremap jk <Esc>
inoremap kj <Esc>
nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nmap <Leader>rc :e ~/.vimrc<CR><C-l>
nmap <Leader>n :NERDTree<CR><C-l>

" NERDTree Config
autocmd VimEnter * wincmd p
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr', '\.DS_Store']
let NERDTreeKeepTreeInNewTab=1
let NERDTreeWinSize=30
let g:nerdtree_tabs_open_on_gui_startup=0
" End NERDTree Config

" CTRL-P config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'
let g:ctrlp_custom_ignore = '\v[\/](static|static2|bower_components|node_modules|tmp)$'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']


" Colorscheme defaults
colorscheme base16-default
set background=dark
set colorcolumn=100
" End colorscheme defaults

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell


" Angular escaping
let g:reload_on_write = 0
let g:syntastic_html_tidy_ignore_errors=["lacks value", " proprietary attribute",
      \ "unescaped &", "trimming empty", "not recognized", "unexpected",
      \ "escaping malformed"]


" powerline
set rtp+=/Users/merlin/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'base16'

" MacVim specific configurations
if has("gui_running")
    colorscheme gruvbox
    set background=dark
    set guifont=Essential\ PragmataPro:h12
    set guioptions-=r     " hide right scrollbar
    set guioptions-=L     " hide left scrollbar
    set guioptions-=e     " hide graphical tabs
    highlight ColorColumn guibg=#333333

    set guicursor+=i:blinkwait0
endif
autocmd BufWritePre * :%s/\s\+$//e

" CtrlSpace
let g:ctrlspace_ignored_files = '\v(static|static2|node_modules|bower_components|tmp)[\/]'

