"vim configuration file
"disable compatibility mode with vi
set nocompatible

filetype off 
set runtimepath+=~/.vim/
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""
""    Plugins             ""
""""""""""""""""""""""""""""

Bundle "gmarik/vundle"

" From github
Bundle "ervandew/supertab"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-surround"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" From vim-script github
Bundle "bufexplorer.zip"
Bundle "OmniCppComplete"
Bundle "FSwitch"
Bundle "FuzzyFinder"
Bundle "L9"
Bundle "ProtoDef"
Bundle "derekwyatt/vim-scala"


""""""""""""""""""""""""""""
""    Global settings     ""
""""""""""""""""""""""""""""

"turn on specific filetype settings
filetype plugin indent on

"if not on windows, set path
if !has("gui_win32")
    let $VIM = '~/.vim'
endif

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
    if has("gui_gtk2")
        set guifont=Inconsolata\ Bold\ 12
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    else "mac
        set guifont=Menlo:h14
    endif
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
inoremap <C-v> <Esc>"+gPi

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

"open tabs
nnoremap <silent> <C-t> :tabnew<CR>

" Paste Mode!  Dang! <F10>
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
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>

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

" Remap ; and , commands so they also work after t and T
" Only do the remapping for normal and visual mode, not operator pending
" Use @= instead of :call to prevent leaving visual mode
nmap ; @=FixCommaAndSemicolon(";")<CR>
nmap , @=FixCommaAndSemicolon(",")<CR>
vmap ; @=FixCommaAndSemicolon(";")<CR>
vmap , @=FixCommaAndSemicolon(",")<CR>
function! FixCommaAndSemicolon(command)
   let s:pos1 = getpos(".")
   execute "normal! " . a:command
   let s:pos2 = getpos(".")
   if s:pos1 == s:pos2
      execute "normal! 2" . a:command
   endif
   return ""
endfunction

""""""""""""""""""""""""""""
""     OmniCpp            ""
""""""""""""""""""""""""""""
"set tags+=~/.vim/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,preview
set sft

""""""""""""""""""""""""""""
""      SuperTab        ""
""""""""""""""""""""""""""""


""""""""""""""""""""""""""""
""      FSwitch           ""
""""""""""""""""""""""""""""
nnoremap <silent> <Leader>of :FSHere<CR>
nnoremap <silent> <Leader>ol :FSRight<CR>
nnoremap <silent> <Leader>oL :FSSplitRight<CR>
nnoremap <silent> <Leader>oh :FSLeft<CR>
nnoremap <silent> <Leader>oH :FSSplitLeft<CR>
nnoremap <silent> <Leader>ok :FSAbove<CR>
nnoremap <silent> <Leader>oK :FSSplitAbove<CR>
nnoremap <silent> <Leader>oj :FSBelow<CR>
nnoremap <silent> <Leader>oJ :FSSplitBelow<CR>

""""""""""""""""""""""""""""
""      FuzzyFinder       ""
""""""""""""""""""""""""""""
nnoremap <Leader>fb :FufBuffer<CR>
nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>ft :FufTag<CR>

""""""""""""""""""""""""
"    NERD TREE        ""
""""""""""""""""""""""""
" Toggle the NERD Tree on an off with F9
nmap <F9> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F9
nmap <S-F9> :NERDTreeClose<CR>

" Store the bookmarks file in perforce
let NERDTreeBookmarksFile="$HOME/.vim/NERDTreeBookmarks"

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]


""""""""""""""""""""""""
"    minibuffer bar   ""
""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 


""""""""""""""""""""""""
""     Tag List        "
""""""""""""""""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>

""""""""""""""""""""""""
""     STATUS LINE     "
""""""""""""""""""""""""
"statusline setup
set statusline=%f "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%= "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ "current highlight
set statusline+=%{'Buf:'}         
set statusline+=%n\ 
set statusline+=%{'Col:'}
set statusline+=%c\ 
set statusline+=%{'Line:'}
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2



""""""""""""""""""""""""""""
""      Auto commands     ""
""""""""""""""""""""""""""""

"remove trailing whitespace
augroup trailingWhitespace
   au!
   autocmd BufRead,BufWrite *.cpp,*.h,*.java :%s/\s\+$//e
augroup END

"status line au
augroup status
   au!
   "recalculate the trailing whitespace warning when idle, and after saving
   autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
   "recalculate the tab warning flag when idle and after writing
   autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
   "recalculate the long line warning when idle and after saving
   autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
augroup END
""""""""""""""""""""""""""""
""      Functions         ""
""""""""""""""""""""""""""""

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
"}}}

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
