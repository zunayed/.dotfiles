set background=dark
set autoindent
set complete-=i
set relativenumber
set timeoutlen=50
set ruler
set laststatus=2
set backspace=indent,eol,start 
set swapfile
set dir=/tmp/
set pastetoggle=<F2>
set clipboard=unnamed

let mapleader=","

syntax on
syntax enable

" tab settings
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" spell check settings
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" autocomplete ctrl-n or ctrl-p in insert mode
set complete+=kspell

" Disable arrow keys so I can actually learn vim
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Plugins
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Control P 
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" Pathogen 
execute pathogen#infect()
call pathogen#helptags()

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501'

" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1

"let g:airline#left_sep = '|'
"let g:airline#left_alt_sep = '|'

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Quit if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" python mode
"let g:pymode_folding = 0
"let g:pymode_options_colorcolumn = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_lint = 0
"
