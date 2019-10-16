call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()

set background=dark
set autoindent
set complete-=i
set number
set timeoutlen=50
set ruler
set laststatus=2
set backspace=indent,eol,start
set swapfile
set dir=/tmp/
set clipboard=unnamed
set lazyredraw
set mouse=a
set cul
set ruler
set wildmenu
set cursorcolumn
set pastetoggle=<F2>
set spell
set term=screen-256color
set t_Co=256

filetype on
filetype plugin on
filetype indent on

" tab settings
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" filetype overrides
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2

" When I close a tab, remove the buffer
set nohidden

" autocomplete ctrl-n or ctrl-p in insert mode
set complete+=kspell

" Leader key to space
let mapleader = "\<Space>"

" Spellcheker toggle
:map <F5> :setlocal spell! spelllang=en_us<CR>

" Turn of numbers
nnoremap <F4> :set nonumber!<CR>

" split navigations ex. Ctrl-J K L H - to move
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
nnoremap colon to semicolon

nore ; :

syntax on
syntax enable

" spell check settings
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Disable arrow keys so I can actually learn vim
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" on save any: trim trailing whitespace
" autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm '''


" let Vundle manage Vundle, required
" Plugin 'airblade/vim-gitgutter'
" Plugin 'bling/vim-airline'
" Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" Plugin 'flazz/vim-colorschemes'
" Plugin 'nvie/vim-flake8'
" Plugin 'pangloss/vim-javascript'
" Plugin 'scrooloose/syntastic'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-sensible'
" Plugin 'tpope/vim-surround'
" Plugin 'valloric/MatchTagAlways'
" Plugin 'ajh17/VimCompletesMe'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'fatih/vim-go'
" Plugin 'posva/vim-vue'
" Plugin 'kien/ctrlp.vim'
" Plugin 'sheerun/vim-polyglot'
" Plugin 'joshdick/onedark.vim'
" Plugin 'junegunn/goyo.vim'

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '.vscode', '.git', 'node_modules']
" let g:NERDTreeDirArrows=0


" Quit if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1

" airline settings
let g:airline_powerline_fonts = 0
let g:airline_theme='luna'
let g:airline_left_sep=''
let g:airline_righ_sep=''
let g:airline_left_alt_sep= '|'
let g:airline_right_alt_sep= '|'

" F6 will set breakpoint
nnoremap <silent> <F6> <esc>oimport pudb; pudb.set_trace()<esc>

" Theme
colorscheme PaperColor

" Autoload vimrc file
autocmd! bufwritepost .vimrc source %

" ctrl p ignore certain files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
