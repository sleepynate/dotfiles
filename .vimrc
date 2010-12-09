" we're using vim, not vi.
set nocompatible

" enable pathogen before anything else
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on

" allow backspacing over everything in insert mode
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
set showmatch                  " how matching braces
set showmode                   " show the mode i'm in
syntax on                      " well duh, highlist that shit!
set hlsearch                   " highlight search stuff too
set t_Co=256                   " convince terminals to look pretty
set hidden
"set nowrap

" i hate how vim, by default, saves the little *~ files everywhere. guys,
" confine that shit to a tmp directory so i don't constantly have to
" find -name '*~' -delete
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set diffopt+=iwhite


" i think this is important but so i left it in...
" Only do this part when compiled with support for autocommands. {{{
if has("autocmd")
	filetype plugin indent on
	augroup vimrcEx
		au!
		autocmd FileType text setlocal textwidth=78
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif
	augroup END
else
	set autoindent		" always set autoindenting on
endif " has("autocmd") }}}

" set colorchemes and font
if has("gui_running")
	colorscheme proton
else
	colorscheme darkburn
endif
set gfn=roxanne\ 10 " <-- awesome font by steve "pokey" schmitt

" shut off useless-ass menubar and buttons
set guioptions=aegt
" but define a mapping to return them as needed
nmap <C-F11> :if &guioptions=~'m'\|set guioptions-=m\|else\|set guioptions+=m \|endif<CR>

map <F12> :TlistToggle<CR>
" even though i'm an xmonad guy, sometimes i use a mouse
set mouse=a

" default fold method is marker
set foldmethod=syntax

"
" map awesome keys of awesome.
"

" remove extraneous trailing whitespaces
nmap <F2> :%s/\s\+$//<CR>
" quote all map indexes that are left unquoted
nmap <F3> :%s#\[\([a-zA-Z0-9_]\+\)\]#['\1']#g<CR>

" map Alt+1 through Alt+0 to tab 1, tab 2, tab 3, etc.
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt
map <A-0> 10gt

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

" who the fuck wants to type Ctrl-Shift-X Ctrl-Shift-O for omni?
inoremap <C-O> <C-X><C-O>
inoremap <C-O> <C-X><C-O>

" swap ` (backtick) and ' (single quote)
nnoremap ' `
nnoremap ` '

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

" document function
nmap <silent> <leader>d :set paste<CR>:call PhpDoc()<CR>:set nopaste<CR>

" beautify php
nmap <silent> <Leader>pb :%!php_beautifier -l "ArrayNested Pear()" %<CR>

" ,v to auto-open vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>
" also, automagically source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ,p "P"aste to gist
nmap <leader>p :Gist<CR>

" VCSCommand is awesome, but the default mappings conflict with NERDCommenter
nmap <leader>ga :VCSAdd<CR>
nmap <leader>gn :VCSAnnotate<CR>
nmap <leader>gN :VCSAnnotate!<CR>
nmap <leader>gc :VCSCommit<CR>
nmap <leader>gD :VCSDelete<CR>
nmap <leader>gd :VCSDiff<CR>
nmap <leader>gg :VCSGotoOriginal<CR>
nmap <leader>gG :VCSGotoOriginal!<CR>
nmap <leader>gi :VCSInfo<CR>
nmap <leader>gl :VCSLog<CR>
nmap <leader>gL :VCSLock<CR>
nmap <leader>gr :VCSReview<CR>
nmap <leader>gs :VCSStatus<CR>
nmap <leader>gu :VCSUpdate<CR>
nmap <leader>gU :VCSUnlock<CR>
nmap <leader>gv :VCSVimDiff<CR>

" i hate typing my email address.
abbr myemail nathan (period) dotz (at) gmail (period) com

" filetype-specific settings.
filetype plugin on

au FileType php set omnifunc=phpcomplete#CompletePHP
" syntax-highlight SQL in PHP strings, and HTML in PHP strings
"let php_sql_query=1
"let php_htmlInStrings=1

" auto-save views on open/close
"au BufWrite *.php mkview
"au BufRead *.php silent loadview

" auto-lint php files every time we save
"au BufWritePost *.php !php -l %

" manage the way we deal with spaces in python files
au BufEnter *.py set tabstop=4
au BufEnter *.py set shiftwidth=4
au BufEnter *.py set smarttab
au BufEnter *.py set expandtab
au BufEnter *.py set softtabstop=4
au BufEnter *.py set autoindent
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Plugin-specific
" delimitMate
let delimitMate_matchpairs         = "(:),[:],{:}"
"let b:delimitMate_expand_cr       = "\<CR>\<CR>\<Up>\<Tab>"
"let delimitMate_expand_space      = "\<Space>\<Space>\<Left>"
let b:delimitMate_expand_cr        = 1
let delimitMate_expand_space       = 1
" gist.vim
let g:gist_detect_filetype         = 1
let g:gist_clip_command            = 'xclip -selection clipboard'
let g:gist_open_browser_after_post = 1
" vimclojure
let clj_paren_rainbow              = 1
let clj_highlight_builtin          = 1
let clj_highlight_contrib          = 1
let clj_want_gorilla               = 1
let vimclojure#NailgunClient       = "/usr/bin/ng"
" pydiction
let g:pydiction_location           = '~/.vim/complete-dict'
" snipmate
au BufRead *.php set ft=php.html   " dot-style syntax for multiple filetypes
au BufEnter *.php set ft=php.html

let g:buftabs_only_basename=1

set cursorline

source ~/.vim/rtm_keys
