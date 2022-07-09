set nocompatible              " be iMproved, required
set colorcolumn=120
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Code completion is the best thing ever
" Stopped using YCM because clunky
" Plugin 'Valloric/YouCompleteMe'
" Not using syntastic on gentoo since errors
" Plugin 'vim-syntastic/syntastic'
" File directory traverser
Plugin 'scrooloose/nerdtree'
" Adds useful info in a status bar at the bottom of the window
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rhysd/vim-clang-format'
" For traversing function definitions etc
Plugin 'taglist.vim'
call vundle#end()
filetype plugin indent on "enable indents

set backspace=indent,eol,start
set autoindent
set tabstop=4 "number of visual spaces per tab
set shiftwidth=4 "on pressing tab, insert 4 spaces
set softtabstop=4
set expandtab
set number "shows line numbers
set cursorline "highlights the current line
set showmatch "highlights the matching parenthesis you are currently on
set nohlsearch "highlights the matches during searches
set incsearch "live search as characters are entered
set ruler
set foldenable
set foldlevelstart=10
set foldmethod=indent
set showcmd

set t_Co=256
syntax enable "enables syntax colors
colorscheme deus "changes the syntax colors

let mapleader=","
let NERDTreeShowLineNumbers=1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1

" Syntastic
let g:syntastic_cpp_checkers = ['clang_check', 'gcc', 'cppcheck']
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-clang-format
let g:clang_format#detect_style_file = 1

inoremap <C-J> <ESC><C-W><C-J>
inoremap <C-K> <ESC><C-W><C-K>
inoremap <C-L> <ESC><C-W><C-L>
inoremap <C-H> <ESC><C-W><C-H>
inoremap jj <ESC>

" Makes for a much smoother experience switching between buffers
" Sooo much better
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Make ctags show all options when multiple tags are available
nnoremap <C-]> g<C-]>

nnoremap <space> za
nnoremap <leader>w :w<CR>
nnoremap <leader>j Lzt
nnoremap <leader>k Hzb
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>b $A<space>{<CR>}<ESC>O
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>t :TlistToggle<CR>
nnoremap <leader>f :lopen<CR>
nnoremap <leader>g :lclose<CR>

" below lets you type Ngb to jump to buffer number N ( i.e. 3gb will jump to
" buffer 3)
let c = 1
while c <= 99
    execute "nnoremap" . c . "gb :" . c . "b\<CR>"
    let c += 1
endwhile
