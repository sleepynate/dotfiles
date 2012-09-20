set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'minibufexpl.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'surround.vim'
Bundle 'ragtag.vim'
Bundle 'WebAPI.vim'
Bundle 'mattn/gist-vim'
Bundle 'claco/jasmine.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/neocomplcache'

filetype on

let macvim_skip_cmd_opt_movement = 1

set backspace=indent,eol,start
set backup                     " keep a backup file
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set number                     " show line numbers
set numberwidth=4              " line numbers 4 chars wide
set shiftwidth=4               " indent 4 spaces automatically
set tabstop=4                  " tabs look 4 spaces wide
set expandtab
set showmatch                  " show matching braces
set showmode                   " show the mode i'm in
syntax on                      " well duh, highlist that shit!
set hlsearch                   " highlight search stuff too
set t_Co=256                   " convince terminals to look pretty
set hidden
set autoindent

colorscheme Tomorrow-Night

set guioptions=aegt
nmap <C-F11> :if &guioptions=~'m'\|set guioptions-=m\|else\|set guioptions+=m \|endif<CR>


set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" map Alt+1 through Alt+0 to tab 1, tab 2, tab 3, etc.
" map <A-1> 1gt
" map <A-2> 2gt
" map <A-3> 3gt
" map <A-4> 4gt
" map <A-5> 5gt
" map <A-6> 6gt
" map <A-7> 7gt
" map <A-8> 8gt
" map <A-9> 9gt
" map <A-0> 10gt

" map otherwise useless arrow keys to navigate between window splits
map <up>    :wincmd k<CR>
map <down>  :wincmd j<CR>
map <right> :wincmd l<CR>
map <left>  :wincmd h<CR>

" alt-right and alt-left to cycle buffers in a split
map <A-right> :bnext<CR>
map <A-left>  :bprevious<CR>
" compensate for terminal
map <right> :bnext<CR>
map <left>  :bprevious<CR>

" alt-up and alt-down to cycle tabs in a split
map <A-down> :tabnext<CR>
map <A-up>   :tabprevious<CR>
map <down> :tabnext<CR>
map <up>   :tabprevious<CR>

" jump through error list.
map <C-right> :cn<CR>
map <C-left>  :cp<CR>
map <C-up> :copen<CR>
map <C-down>  :cclose<CR>

" who the fuck wants to type Ctrl-X Ctrl-O for omni?
inoremap <C-space> <C-X><C-O>
inoremap <C-space> <C-X><C-O>


" when in insert mode, type a double-; or double-: will jump to the end before
" inserting
au FileType py inoremap :: <Esc>A:
inoremap ;; <Esc>A;

" behold, the mighty leader key.
let mapleader = ","

" vim likes to forget the proper directory. make a short version of autodir
nmap <silent> <Leader>cd :cd %:p:h<CR>

" map ,s to show whitespace markup (great for fixing python)
set listchars=tab:▸\ ,trail:☠,eol:¬
nmap <silent> <leader>s :set nolist!<CR>

" ,v to auto-open vimrc in a new tab
nmap <leader>v :e ~/.vimrc<CR>
" also, automagically source the vimrc file after saving it
augroup AutoReloadVimRC
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" fuck that buffer.
nmap <silent> <Leader>k :bd<CR>

autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2

autocmd FileType ruby set sw=2
autocmd FileType ruby set ts=2
autocmd FileType ruby set sts=2
autocmd FileType ruby set textwidth=79
autocmd FileType ruby set omnifunc=rubycomplete#Complete
