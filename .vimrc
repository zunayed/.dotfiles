call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

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
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-sensible'
" Plugin 'tpope/vim-surround'
" Plugin 'valloric/MatchTagAlways'
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

" --------------------------------------------------------------------------------------
" Copied and pasted from coc github readme
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" Silver searcher/Ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
