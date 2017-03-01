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

filetype plugin indent on

" tab settings
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

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
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm '''

" Plugins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'valloric/MatchTagAlways'
Plugin 'valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required

" Control P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
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

" Youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" F6 will set breakpoint
nnoremap <silent> <F6> <esc>oimport pudb; pudb.set_trace()<esc>

" Theme
colorscheme molokai

" Autoload vimrc file
autocmd! bufwritepost .vimrc source %

" Syntastic
let g:syntastic_python_checkers=['flake8']

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
