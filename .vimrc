filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""" let Vundle manage Vundle
""" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
""" cosmetic
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'itchyny/lightline.vim'
Bundle 'bling/vim-bufferline'
""" util
Bundle 'L9'
Bundle 'WebAPI.vim'
Bundle 'Shougo/neocomplcache'
" Bundle 'valloric/YouCompleteMe'
""" synxtax and movements
Bundle 'scrooloose/syntastic'
Bundle 'surround.vim'
Bundle 'ragtag.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'matchit.zip'
Bundle 'Tabular'
Bundle 'FuzzyFinder'
""q" OSX bullshit
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
""" services
Bundle 'mattn/gist-vim'
Bundle 'mrtazz/simplenote.vim'
""" tests
Bundle 'claco/jasmine.vim'
""" language modes
" org
Bundle 'vim-orgmode'
" python
Bundle 'klen/python-mode'
" ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
" scala
Bundle 'vim-scala'
" haskell
Bundle 'bitc/vim-hdevtools' 
" Arduio
Bundle 'nichtich/vim-arduino.git'
Bundle 'Arduino-syntax-file'
" Android
" Bundle 'groovy.vim'
Bundle 'tfnico/vim-gradle'
Bundle 'javacomplete'
" Erlang
Bundle 'jimenezrick/vimerl'

filetype on
filetype indent on
filetype plugin on

let macvim_skip_cmd_opt_movement = 1

set backspace=indent,eol,start
set backup                     " keep a backup file
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching -- search-as-you-type
set number                     " show line numbers
set relativenumber
set numberwidth=4              " line numbers 4 chars wide
set shiftwidth=4               " indent 4 spaces automatically
set tabstop=4                  " tabs look 4 spaces wide
set expandtab                  " insert spaces instead of tabs
set showmatch                  " show matching braces
set showmode                   " show the mode i'm in
syntax on                      " well duh, highlist that shit!
set hlsearch                   " highlight search stuff too
set t_Co=256                   " convince terminals to look pretty
set hidden
set autoindent

" Shorten <Esc> delay
set timeout timeoutlen=1000 ttimeoutlen=100

set wildmode=longest:full
set wildmenu


""
" Cosmetics - color scheme, get rid of the gui, controls, etc.
""

if has('gui_running')
  colorscheme Tomorrow-Night
  let g:lightline = {
        \ 'colorscheme': 'Tomorrow_Night',
        \ 'component': {
        \   'readonly': '%{&readonly?"":""}',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
else
  set background=dark
  colorscheme Tomorrow-Night
  let g:lightline = {
        \ 'colorscheme': 'Tomorrow_Night',
        \ 'component': {
        \   'readonly': '%{&readonly?"":""}',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
endif

set guioptions=aegt
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
nmap <C-F11> :if &guioptions=~'m'\|set guioptions-=m\|else\|set guioptions+=m \|endif<CR>

set laststatus=2


""
" Instead of leaving 'tilde turds' all over the system, drop everything
" in a single backup dir
""

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""
" 'Features' I added - alt-key navigation
""

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
map <leader><right> :bnext<CR>
map <leader><left>  :bprevious<CR>

" alt-up and alt-down to cycle tabs in a split
map <A-down> :tabnext<CR>
map <A-up>   :tabprevious<CR>
map <leader><down> :tabnext<CR>
map <leader><up>   :tabprevious<CR>

" jump through error list.
map <C-right> :cn<CR>
map <C-left>  :cp<CR>
map <C-up> :copen<CR>
map <C-down>  :cclose<CR>

""
" Make typing life easier.
""

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

nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Toggle bizarre line numbers
nnoremap <leader>n :NumbersToggle<cr>

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
nmap <silent> <leader>k :bd<CR>
nmap <silent> <leader>w :w<CR>

com! W w
com! Qa qa

" Allow NeoComplCache at startup
let g:neocomplcache_enable_at_startup = 1

nmap <leader>ff :FufFile<CR>
nmap <leader>fb :FufBuffer<CR>

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1

autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd FileType html set shiftwidth=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2

autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set ts=2
autocmd FileType ruby set sts=2
"autocmd FileType ruby set textwidth=79
autocmd FileType ruby set omnifunc=rubycomplete#Complete

let g:pymode_doc = 1
let g:pymode_lint = 1
let g:pymode_rope = 1
" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1
" Enable autoimport
let g:pymode_rope_enable_autoimport = 1
" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_global_prefix = "<C-x>p"
let g:pymode_rope_local_prefix = "<C-c>r"
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = ""
let g:pymode_rope_always_show_complete_menu = 0
let g:pymode_folding = 0
let g:pymode_motions = 1
let g:pymode_utils_whitespaces = 1
let g:pymode_indent = 1
let g:pymode_virtualenv = 1
let g:pymode_syntax_all = 1

autocmd Filetype java setlocal omnifunc=javacomplete#Complete 

autocmd FileType xml set shiftwidth=2
autocmd FileType xml set ts=2
autocmd FileType xml set sts=2

autocmd FileType markdown set shiftwidth=4
autocmd FileType markdown set ts=4
autocmd FileType markdown set sts=4
autocmd FileType markdown set textwidth=79

""
"
" Plugin includes
"
""
" source ~/.simplenoterc
