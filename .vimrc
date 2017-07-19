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
" Plugin 'valloric/YouCompleteMe'
" Plugin 'shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'posva/vim-vue'
Plugin 'kien/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/goyo.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Control P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/node_modules/*,*/venv/*

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
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" F6 will set breakpoint
nnoremap <silent> <F6> <esc>oimport pudb; pudb.set_trace()<esc>

" Theme
colorscheme onedark
" colorscheme molokai

" Autoload vimrc file
autocmd! bufwritepost .vimrc source %

" Syntastic
let g:syntastic_python_checkers=['flake8']

" folding
" set foldmethod=indent
" set foldlevel=0
" set foldclose=all
" inoremap <F9> <C-O>za
" nnoremap <F9> za
" onoremap <F9> <C-C>za
" vnoremap <F9> zf

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" From onedark  github page needed for 24-bit color support
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
