" Jaume Devesa 2016 - My vimrc files.
"
" This is my vimrc file started from scratch. It is absolutely configured
" according my own way to use vim, but it may be helpful for others.
"

" ===================================
" Plugins (Vundle must be on the top)
" ===================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'              " Manage the plugins runtimepath and install new plugin
Plugin 'tpope/vim-sensible'                " Manage mostly non-compatible options everyone agrees on
Plugin 'junegunn/goyo.vim'                 " Fullscreen editing zen-mode
Plugin 'scrooloose/nerdtree'               " Navigate across the files
Plugin 'majutsushi/tagbar'                 " Tagbar right window
Plugin 'tpope/vim-fugitive'                " Git commands and utilities
Plugin 'vim-airline/vim-airline'           " Cool status line
Plugin 'vim-airline/vim-airline-themes'    " Cool status line themes
Plugin 'tpope/vim-commentary'              " Easy comment lines `gcc` and `gc`
Plugin 'scrooloose/syntastic'              " Syntax checking for many languages
Plugin 'airblade/vim-gitgutter'            " Show which lines have changed from git
Plugin 'altercation/vim-colors-solarized'  " Solarized theme
call vundle#end()
filetype on

"  NERDTree
nnoremap <silent><F2> :NERDTreeToggle<CR>
let NERDTreeAutoCenter = 2
let NERDTreeCaseSensitiveSort = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 2
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\~$','\.pyc$','\py.class$']
let NERDTreeShowLineNumbers=0
let NERDTreeDirArrows=0
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden = 1

"  Goyo
nnoremap <silent><F7> :Goyo<CR>

"  Airline
set laststatus=2         " We should add this line to watch airline from the begging
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
  let g:airline_symbols.branch = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '(nobranch)'
let g:airline#extensions#virtualenv#enabled = 1

" Tagbar
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width = 30

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ==============
" Search options
" ==============

set ignorecase          " Ignore capital letters on search

" ===============
" Display options
" ===============

set showcmd             " Display incomplete commands
set showmode            " Show the current mode on the taskbar
set cursorline          " Highlight the screenline of the cursor
set number              " Show the number of the line
set background=dark
" colorscheme bubblegum   " Chosen colorscheme
let g:solarized_termcolors=256
colorscheme solarized

set splitbelow          " New vertical splits will place the new one below
set splitright          " New horitzonal splits will place the new one on right

" =====================================================================
" Behaviour options. It assumes that VIM is compiled with +autocommands
" =====================================================================

let mapleader = ","

set tabstop=4          " Pressing <Tab> will move the next tab value at 4 columns ahead as much
set shiftwidth=4       " Number of spaces introduced for each step of autoindent
set expandtab          " When pressing <Tab> it will actually introduce spaces
set smartindent        " Do autoindent in a next line... for C it works, for the rest depends on the plugin

set hidden             " Put a buffer in hidden when abandoned instead of descarding it

augroup vimrcEx         " Put these in an autocmd group, so that we can delete them easily.


if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

" Autoload changes in .vimrc
  autocmd BufWritePost .vimrc source $MYVIMRC

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

augroup END

" =========================
" Interface-enabled options
" =========================
if has('mouse')         " In many terminal emulators the mouse works just fine, thus enable it.
  set mouse=a
endif

" ===============
" Maps and remaps
" ===============

" Move around tabs
noremap <silent> ,t :tabnew<CR>
noremap <silent> ,n :tabn<CR>
noremap <silent> ,p :tabp<CR>
noremap <silent> ,c :tabclose<CR>

" Move around the windows
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

" Rotate window
noremap <silent> ,r :wincmd r<CR>
