set number                   " Show filenumber
set numberwidth=1            " Width of the filenumber
set mouse=a                  " Allows interact with the mouse
set clipboard=unnamed        " Accesing the system clipboard
set showcmd					 " Show executed commands
set ruler					 " Show row and column of the cursor
set showmatch				 " Highlights the corresponding parenthesis
set laststatus=2			 " Show the status bar
set hlsearch           	     " Highlight search results
set incsearch                " Incremental search
set ignorecase               " Searches are case insensitive...
set smartcase                " ... unless they contain at least one capital letter
set cursorline 		     " Show cursor linei
set scrolloff=5		     " When scrolling, keep cursor 5 lines from screen border
set tabstop=4 		     " How many spaces per tab
set softtabstop=4 	     " Control how many columns vim uses when you hit Tab in insert mode

syntax on                    " Enable syntax

set undofile                      " Persistent undos after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo " If you exit vim and later start, vim remembers information like, command line history, search history, etc

" Pluggins
call plug#begin('.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Autocompletion
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-scripts/AutoComplPop'

" Git integration
Plug 'airblade/vim-gitgutter'

" Syntactic analysis
Plug 'scrooloose/syntastic'

" Run tests
Plug 'janko-m/vim-test', { 'for': ['python'] }
Plug 'tpope/vim-dispatch' " asynchronous

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

call plug#end()

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "dark"

let mapleader=" " " Set leader key

nmap <Leader>s <Plug>(easymotion-s2)

nnoremap <leader>q <esc>:q<cr> " Quit file

" NERDTree ----------------------------
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeIgnore = ['\pyc$', '\.pyo$', '__pycache__']
let NERDTreeHighlightCursorline = 1  " Show cursor line

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" Syntastic ----------------------------

let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Vim tests -----------------------------

" run tests in a vim8 terminal
let g:test#strategy = "vimterminal"

nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>rT :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>

