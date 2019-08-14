call plug#begin('~/.vim/plugged')
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ajh17/Spacegray.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'jacoborus/tender.vim'
Plug 'janko/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-grepper'
Plug 'morhetz/gruvbox'
Plug 'mrk21/yaml-vim'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ScrollColors'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
call plug#end()

call deoplete#custom#option('num_processes', 5)


let g:deoplete#enable_at_startup = 1
let g:nvim_typescript#default_mappings = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:node_host_prog = '/usr/local/bin/neovim-node-host'
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1

highlight TestOk    ctermbg=green
highlight TestError ctermbg=red

syn match TestOk    "\<Ok:"
syn match TestError "\<Err:"

set nocompatible
let mapleader=","
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" add yaml stuffs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set signcolumn=yes

let g:test#preserve_screen = 1
let test#strategy = "neovim"

" Reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>f :Grepper<CR>

nmap <silent> <leader>n :NERDTreeToggle<CR>
filetype plugin indent on

set mouse=a

nnoremap ; :
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Testing
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

nmap <silent> <leader>T :split term://fish<CR>


set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-B> :bprev<CR>
nnoremap <C-X> :bd<CR>
let g:airline#extensions#tabline#enabled = 1

" For Neovim 0.1.3 and 0.1.4
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <C-i> <Plug>(coc-codeaction)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Theme
syntax enable
"set termguicolors
"set background=dark
"colorscheme base16-darktooth
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


let g:ctrlp_user_command = ['.git', 'cd %s ; rg --files-with-matches ".*"', 'find %s -type f']
