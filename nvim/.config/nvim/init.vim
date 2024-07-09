"vim configuration file
"disable compatibility mode with vi

if &compatible
  set nocompatible
endif

filetype off

" append to runtime path
set rtp+=/usr/share/vim/vimfiles
set rtp+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" initialize dein, plugins are installed to this directory
call dein#begin(expand('~/.cache/dein'))

""""""""""""""""""""""""""""
""    Plugins             ""
""""""""""""""""""""""""""""

" From github
call dein#add(expand('~/.cache/dein/repos/github.com/Shougo/dein.vim'))

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('vim-syntastic/syntastic')
call dein#add('tpope/vim-surround')

" exit dein
call dein#end()

" auto-install missing packages on startup
if dein#check_install()
  call dein#install()
endif


""""""""""""""""""""""""""""
""    Global settings     ""
""""""""""""""""""""""""""""

set clipboard+=unnamedplus

"turn on specific filetype settings
filetype plugin indent on

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Make command line two lines high
set ch=2

"Make sure unsaved buffers that are to be put in the background are allowed
"to go in there
"set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

"syntax hightlighting
syntax on

set ts=2
set shiftwidth=2
set shiftround       "use multiple of shiftwidth when applying '>' or '<'
set autoindent
set expandtab        "use proper tab space

"show tags for word completion
set showfulltag
set completeopt=menuone,longest

"remove scanning included files
set complete-=i

"set path
set path=
set path+=/usr/local/include/**
set path+=/usr/include/**

set t_vb=            "disable bell
set number           "turn on line number
set ruler            "ensure each window contains a status line
set showmatch        "enable brief cursor jump to matching brace
set showcmd          "show typed command in ruler
set showmode         "show mode in ruler
set linebreak        "word wrap at specific point
set lazyredraw       "dont update display when executing macro"
set mousehide        "hide mouse while typing"
set scrolloff=8      "keep cursor below or above 8 lines from bottom
set diffopt+=iwhite  "diff ignores white space

if has("gui_running")
  set lines=999 columns=999     "fill full screen
  set guioptions-=T             "remove toolbar
  set guifont=Monaspace\ Neon\ Bold\ 12
elseif exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Monaspace Neon Bold 12')
else
  set mouse=a                   "enable mouse in terminal
  set t_Co=256                  "activate 256 colors in terminal
endif

colorscheme mustang              "activatee theme

"ignore case and smartcase
set ignorecase
set smartcase

"tab complete
set wildmode=list:longest,full    "make cmdline tab completion similar to bash
set wildmenu                      "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~    "stuff to ignore when tab completing

set virtualedit=all     "allow cursor to stray off words

"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=4       "deepest fold is 4 levels
set nofoldenable        "dont fold by default

"highlight search
set hlsearch
hi Search guifg=yellow guibg=NONE gui=bold ctermfg=yellow ctermbg=NONE cterm=bold
"search as i type
set incsearch

set history=200 "keep 200 lines in command line history

" Allow copy on mouse selection
set mouse=

""""""""""""""""""""""""""""
""      Mappings          ""
""""""""""""""""""""""""""""
" build tags of your own project with Ctrl-F12
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"cd to the directory containing the file in the buffer
nmap <silent> <Leader>cd :lcd %:h<CR>

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>


"newline without entering insert mode
nnoremap <S-Enter> O<Esc>j
nnoremap <CR> o<Esc>k

"paste keep format
"inoremap <C-v> <Esc>"+gPi

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

"open tabs
nnoremap <silent> <C-t> :tabnew<CR>

" Paste Mode! <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

"make jj go back to normal mode from insert
inoremap jj <Esc>

" Map <c-s> to search
inoremap <C-s> <C-o>/
nnoremap <C-s> /

" Map <c-$> to move to the end of a line in insert mode
"inoremap <C-$> <C-o>$

" Map <c-^> to move to the beginning of a line in insert mode
"inoremap <C-^> <C-o>^

" Map <c-f> to move forward a word in insert mode
inoremap <C-f> <C-o>w

" Map <c-b> to move backward a word in insert mode
inoremap <C-b> <C-o>b

"edit and source .vimrc
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>s :source ~/.config/nvim/init.vim<CR>

"Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

"page down and up
nnoremap <silent> <Space> <C-d>
nnoremap <silent> - <C-u>

"remap Y to be consistent with C and D
nnoremap <silent> <S-Y> y$

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" Ctrl-J/K/L/H select split
"nnoremap <silent> <C-J> <C-W>j
"nnoremap <silent> <C-K> <C-W>k
"nnoremap <silent> <C-L> <C-W>l
"nnoremap <silent> <C-H> <C-W>h

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

