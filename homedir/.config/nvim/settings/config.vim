set nocompatible
set shell=/bin/sh

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

" for vim 8 / neovim 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

syntax on
syntax enable
filetype plugin indent on

" let g:gruvbox_italic=1
" let g:gruvbox_bold=1
" let g:gruvbox_termcolors=1
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_contrast_light='medium'
" colorscheme gruvbox
" **************************************************************
" Theme
" **************************************************************
set background=dark
colorscheme everforest
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" **************************************************************
" General
" **************************************************************
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set history=1000     " How many lines of history to remember
set cf               " enable error files and error jumping
set ffs=unix,dos,mac " support all three, in this order
set viminfo+=!       " make sure it can save viminfo
set isk+=_,$,@,%,#   " none of these should be word dividers, so make them not be
set nosol            " leave my cursor where it was
set clipboard=unnamed

" **************************************************************
" Files/Backups/Sessions
" **************************************************************
set nobackup
set nowb
set noswapfile
set directory=~/.vim/temp        " directory for temp files
set makeef=error.err             " When using make, where should it dump the file
set sessionoptions+=globals      " What should be saved during sessions being saved
set sessionoptions+=localoptions " What should be saved during sessions being saved
set sessionoptions+=resize       " What should be saved during sessions being saved
set sessionoptions+=winpos       " What should be saved during sessions being saved

" **************************************************************
" Vim UI
" **************************************************************
set lsp=0                                                                " space it out a little more (easier to read)
set wildmenu                                                             " turn on wild menu
set wildmode=list:longest                                                " turn on wild menu in special format (long format)
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore formats
set ruler                                                                " Always show current positions along the bottom
set cmdheight=1                                                          " the command bar is 1 high
set number                                                               " turn on line numbers
set lz                                                                   " do not redraw while running macros (much faster) (LazyRedraw)
set hid                                                                  " you can change buffer without saving
set backspace=2                                                          " make backspace work normal
set whichwrap+=<,>,h,l                                                   " backspace and cursor keys wrap to
set mouse=a                                                              " use mouse everywhere
set shortmess=atI                                                        " shortens messages to avoid 'press a key' prompt
set report=0                                                             " tell us when anything is changed via :...
set noerrorbells                                                         " don't make noise
set list                                                                 " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:▸\ ,trail:▫,extends:>,precedes:<,nbsp:+,eol:¬
set rnu                                                                  " relative numbering

" **************************************************************
" Visual Cues
" **************************************************************
set showmatch    " show matching brackets
set mat=5        " how many tenths of a second to blink matching brackets for
set nohlsearch   " do not highlight searched for phrases
set incsearch    " BUT do highlight as you type you search phrase
set so=5         " Keep 5 lines (top/bottom) for scope
set novisualbell " don't blink
                 " statusline example: ~\myfile[+] [FORMAT=format] [TYPE=type] [ASCII=000] [HEX=00] [POS=0000,0000][00%] [LEN=000]
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line

" **************************************************************
" Indent Related
" **************************************************************
set ai                    " autoindent (filetype indenting instead)
set nosi                  " smartindent (filetype indenting instead)
set cindent               " do c-style indenting
set softtabstop=2         " unify
set shiftwidth=2          " unify
set tabstop=2             " real tabs should be 4, but they will show with set list on
set copyindent            " but above all -- follow the conventions laid before us
                          " wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
set textwidth=120
filetype plugin indent on " load filetype plugins and indent settings

" **************************************************************
" Text Formatting/Layout
" **************************************************************
set fo=tcrq                          " See Help (complex)
set shiftround                       " when at 3 spaces, and I hit > ... go to 4, not 5
set expandtab                        " no real tabs!
set nowrap                           " do not wrap line
set preserveindent                   " but above all -- follow the conventions laid before us
set ignorecase                       " case insensitive by default
set smartcase                        " if there are caps, go case-sensitive
set completeopt=menu,longest,preview " improve the way autocomplete works
set cursorcolumn                     " show the current column
set cursorline                       " hi CursorLine term=underline ctermbg=008 guibg=#493a35

" **************************************************************
" Folding
"    Enable folding, but by default make it act like folding is
"    off, because folding is annoying in anything but a few rare
"    cases
" **************************************************************
set foldenable        " Turn on folding
set foldmarker={,}    " Fold C style code
set foldmethod=marker " Fold on the marker
set foldlevel=100     " Don't autofold anything (but I can still fold manually)
set foldopen-=search  " don't open folds when you search into them
set foldopen-=undo    " don't open folds when you undo stuff

" highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

set nowrap
set linebreak

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " set grepprg=ag\ --nogroup\ --nocolor
endif

highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" force javascript syntax
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.es6 set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript

"}}}

" vim-commentary, adjust commentstring to support other libs
autocmd FileType apache setlocal commentstring=#\ %s<Paste>

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP


" use homebrew python
" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python_host_prog = '/usr/bin/python'

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" marks 80th column
if (exists('+colorcolumn'))
    set colorcolumn=120
    highlight ColorColumn ctermbg=9
endif


" Reload Vim config {{{
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd
" }}}

" Refresh changed content {{{
augroup refresh
  autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
  autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
" "}}}
"
" Gist {{{
 let g:gist_clip_command = 'pbcopy'
" "}}}

function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
