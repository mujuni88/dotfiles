call plug#begin('~/.vim/bundle')

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" *************************
" General Enhancements
" *************************

" Adds icons to stuff like NERDTREE, Airline, etc
Plug 'ryanoasis/vim-devicons'

" Binary Search Tool
" Plug 'https://github.com/dahu/bisectly', { 'on': 'Bisectly'}

" Dark-powered Async completion (needs python3)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Mutiple cursors
Plug 'terryma/vim-multiple-cursors'

" Add flow to deoplete
Plug 'wokalski/autocomplete-flow'

" Function argument completion for Deoplete
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Tmux line
Plug 'edkolev/tmuxline.vim'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Bottom bar with all settings
Plug 'itchyny/lightline.vim'

" Alignment
Plug 'austintaylor/vim-indentobject'

" Align anything using `ga` command
Plug 'junegunn/vim-easy-align'

" Toggles a sidebar!
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fancy start screen. Lets you open empty buffers, multiple files, etc
Plug 'mhinz/vim-startify'

" Snap windows without ruining your layout using ,ww
Plug 'https://github.com/wesQ3/vim-windowswap'

" Remaps . in a way that plugins can use it too!
Plug 'tpope/vim-repeat'

" Easily delete, change and add surroundings in pairs
Plug 'tpope/vim-surround'

"Bracket maps
Plug 'tpope/vim-unimpaired'

" Indent Guides
Plug 'nathanaelkane/vim-indent-guides', {'on': ['IndentGuidesToggle', 'IndentGuidesEnable']}

" Automatic closing of quotes, parenthesis, brackets, etc
Plug 'Raimondi/delimitMate'

" Change inside surroundings
Plug 'briandoll/change-inside-surroundings.vim'

" focus region, NR will open selected part in new split window
Plug 'chrisbra/NrrwRgn'

" Comments using gcc / gcgc
Plug 'git://github.com/tpope/vim-commentary.git'

" Async linting
Plug 'w0rp/ale'

" Git
" Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
" https://github.com/junegunn/vim-github-dashboard
Plug 'https://github.com/rhysd/committia.vim', { 'for': ['gitcommit']}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'

" Window Swap
Plug 'wesQ3/vim-windowswap'

" Smooth scrolling
Plug 'terryma/vim-smooth-scroll'

" *************************
" Themes
" *************************

Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nerd Syntax Highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" *************************
" Text-Related
" *************************

" Expands on commands like 'delete inside' by adding more targets
Plug 'https://github.com/wellle/targets.vim'

" Better job of detecting sentences
Plug 'https://github.com/reedes/vim-textobj-sentence'

" Makes operating on columns super easy
Plug 'coderifous/textobj-word-column.vim'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'vim-scripts/argtextobj.vim'

" Find & replace, etc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-fnr' | Plug 'junegunn/vim-pseudocl' " find & replace
Plug 'vim-scripts/greplace.vim'
Plug 'https://github.com/simnalamburt/vim-mundo'
Plug 'https://github.com/tpope/vim-abolish' " AWESOME case-sensitive replace
Plug 'vim-scripts/matchit.zip'

" *************************
" Language-Related
" *************************

" Handlebars / Mustache
Plug 'juvenn/mustache.vim'
Plug 'nono/vim-handlebars'

" Javascript
Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'thinca/vim-textobj-function-javascript',    { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Indentation
Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Toolkit - no syntax highlighting https://github.com/moll/vim-node
Plug 'moll/vim-node', { 'for': [ 'javascript', 'js', 'jsx' ]}

Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'js', 'jsx' ]}
" Plug 'othree/es.next.syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'js', 'jsx' ]} "Base syntax highlighter
" Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'js', 'jsx' ]}

" SCSS and CSS syntax highlighting
if v:version < 704
  Plug 'JulesWang/css.vim'
endif
Plug 'cakebaker/scss-syntax.vim'

" HTML
Plug 'tpope/vim-ragtag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'skwp/vim-html-escape', {'for': ['html']}

" TypeScript
Plug 'leafgarland/typescript-vim'

" Coffee Script
Plug 'kchmck/vim-coffee-script'

" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()
