"""""""""""""""""""""""""
"  ____  _              "
" |  _ \| |_   _  __ _  "
" | |_) | | | | |/ _` | "
" |  __/| | |_| | (_| | "
" |_|   |_|\__,_|\__, | "
"                |___/  "
"""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Plug and initialize
call plug#begin('~/.vim/plugins')

Plug 'rafi/awesome-vim-colorschemes'     " Just in case I ever get bored of PaperColor
Plug 'Raimondi/delimitMate'              " Automated closing of parentheses/quotations
Plug 'junegunn/fzf'                      " Extremely fast uzzy finder
Plug 'junegunn/fzf.vim'                  " More hooks for vim to use fzf
Plug 'junegunn/goyo.vim'                 " Disables all UI for better focus
Plug 'yggdroot/indentline'               " Shows levels of indention
Plug 'junegunn/limelight.vim'            " Dims all not-focused paragraphs
Plug 'scrooloose/nerdtree'               " File browser
Plug 'majutsushi/tagbar'                 " Shows tags, ordered by scope, in a pane. (UNCONFIGURED)
Plug 'NLKNguyen/papercolor-theme'        " Bright theme
Plug 'rust-lang/rust.vim'                " Provides rust syntax highlighting
Plug 'scrooloose/syntastic'              " Syntax checking for many different filetypes
Plug 'godlygeek/tabular'                 " Simple but extensible alignment
Plug 'wellle/targets.vim'                " Adds various text objects
Plug 'mbbill/undotree'                   " Undo visualizer, replacement for Gundo
Plug 'vim-airline/vim-airline'           " Replacement for powerline
Plug 'vim-airline/vim-airline-themes'    " Themes for airline
Plug 'tpope/vim-commentary'              " Quick commenting
Plug 'fadein/vim-FIGlet'                 " Quick ascii art
Plug 'tpope/vim-fugitive'                " Git wrapper
Plug 'airblade/vim-gitgutter'            " Show added/removed lines since last git commit
Plug 'terryma/vim-multiple-cursors'      " Multiple cursors
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switches between hybrid and absolute line numbers
Plug 'sheerun/vim-polyglot'              " Also syntax coloring for many different filetypes
Plug 'mhinz/vim-startify'                " Fancy start menu
Plug 'tpope/vim-surround'                " Quick commands to surround words/lines
Plug 'christoomey/vim-tmux-navigator'    " Vim-aware tmux movement
Plug 'tpope/vim-unimpaired'              " Adds a lot of bindings based off of brackets
Plug 'vimwiki/vimwiki'                   " Personal wiki, mostly for notes.
Plug 'shougo/vinarise'                   " Make vim a hex editor
Plug 'Valloric/YouCompleteMe'            " Tab completion

call plug#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""
"   ____                           _  "
"  / ___| ___ _ __   ___ _ __ __ _| | "
" | |  _ / _ \ '_ \ / _ \ '__/ _` | | "
" | |_| |  __/ | | |  __/ | | (_| | | "
"  \____|\___|_| |_|\___|_|  \__,_|_| "
"                                     "
"""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Line numbers, please
set number

" Syntax highlighting
syntax on

" Redraw a lil' faster
set ttyfast

" Enable mouse in all modes
set mouse=a
if !has('nvim')
	set ttymouse=xterm2
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" _   _ ___   _____                    _         "
"| | | |_ _| |_   _|_      _____  __ _| | _____  "
"| | | || |    | | \ \ /\ / / _ \/ _` | |/ / __| "
"| |_| || |    | |  \ V  V /  __/ (_| |   <\__ \ "
" \___/|___|   |_|   \_/\_/ \___|\__,_|_|\_\___/ "
"                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Better color, please.
set t_Co=256
colorscheme PaperColor

" Pretty theme setup.
set laststatus=2
set noshowmode
set background=light

" Gvim tweaks
set guifont=Hack\ 7.5
set guioptions=aig

""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _   ___  __  _____                    _         "
" | | | \ \/ / |_   _|_      _____  __ _| | _____  "
" | | | |\  /    | | \ \ /\ / / _ \/ _` | |/ / __| "
" | |_| |/  \    | |  \ V  V /  __/ (_| |   <\__ \ "
"  \___//_/\_\   |_|   \_/\_/ \___|\__,_|_|\_\___/ "
"                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Clear search highlighting
map <silent> <leader>/ :noh<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Allow for w3m style scrolling
map <silent> J j<C-e>
map <silent> K k<C-y>

" Yank and paste use clipboard instead of vim buffer
" This will not work with minimal vim!
map <leader>y "+y
map <leader>yy "+yy
map <leader>P "+P
map <leader>p "+p

" Map space and shift-space to halfpage-up and halfpage-down
" <NUL> is the literal interpretation of <C-Space>
map <Space> <C-d>
map <NUL> <C-u>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____  _             _          ___        _   _                  "
" |  _ \| |_   _  __ _(_)_ __    / _ \ _ __ | |_(_) ___  _ __  ___  "
" | |_) | | | | |/ _` | | '_ \  | | | | '_ \| __| |/ _ \| '_ \/ __| "
" |  __/| | |_| | (_| | | | | | | |_| | |_) | |_| | (_) | | | \__ \ "
" |_|   |_|\__,_|\__, |_|_| |_|  \___/| .__/ \__|_|\___/|_| |_|___/ "
"                |___/                |_|                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""
" Airline "
"""""""""""

" Use fancy fonts
" let g:airline_powerline_fonts = 1

" Use powerlineish theme
let g:airline_theme='papercolor'

" Enable shiny tab/bufferline
let g:airline#extensions#tabline#enabled = 1

"""""""""""
" FZF.vim "
"""""""""""

" Keybinds
nmap <c-p>f :Files<cr>
nmap <c-p>b :Buffers<cr>
nmap <c-p>l :BLines<cr>
nmap <c-p>m :Marks<cr>

" Set up Colors
let g:fzf_colors = {
	\ 'fg':      ['fg', 'Comment'],
	\ 'bg':      ['bg', 'Comment'],
	\ 'hl':      ['fg', 'Label'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Label'],
	\ 'info':    ['fg', 'Normal'],
	\ 'prompt':  ['fg', 'Normal'],
	\ 'pointer': ['fg', 'Normal'],
	\ 'marker':  ['fg', 'Exception'],
	\ 'spinner': ['fg', 'Normal'],
	\ 'header':  ['fg', 'Normal'] }

" Set fzf to left side to match nerdtree
let g:fzf_layout = { 'left': '~25%' }

""""""""""""""""""""
" Goyo / Limelight "
""""""""""""""""""""

nmap <silent> cog :Goyo<cr>
nmap <silent> cof :Limelight!! 0.7<cr>

let g:goyo_width = 120

autocmd! User GoyoEnter Limelight0.7
autocmd! User GoyoLeave Limelight!

""""""""""""
" Startify "
""""""""""""

let g:startify_custom_header = [
	\"        ________ ++     ________  ",
	\"       /VVVVVVVV\++++  /VVVVVVVV\ ",
	\"       \VVVVVVVV/++++++\VVVVVVVV/ ",
	\"        |VVVVVV|++++++++/VVVVV/'  ",
	\"        |VVVVVV|++++++/VVVVV/'    ",
	\"       +|VVVVVV|++++/VVVVV/'+     ",
	\"     +++|VVVVVV|++/VVVVV/'+++++   ",
	\"   +++++|VVVVVV|/VVV___++++++++++ ",
	\"     +++|VVVVVVVVVV/##/ +_+_+_+_  ",
	\"       +|VVVVVVVVV___ +/#_#,#_#,\ ",
	\"        |VVVVVVV//##/+/#/+/#/'/#/ ",
	\"        |VVVVV/'+/#/+/#/+/#/ /#/  ",
	\"        |VVV/'++/#/+/#/ /#/ /#/   ",
	\"        'V/'  /##//##//##//###/   ",
	\"                 ++               ",
	\]

let g:startify_skiplist = [
						\'\.vimwiki'
						\]

"""""""""""
" Tabular "
"""""""""""
noremap <leader>a :Tabularize /

"""""""""""""""""""""""""""
" Tmux Navigator Bindings "
"""""""""""""""""""""""""""

let g:tmux_navigator_no_mappings = 1

noremap <silent> <C-h> :TmuxNavigateLeft<cr>
noremap <silent> <C-j> :TmuxNavigateDown<cr>
noremap <silent> <C-k> :TmuxNavigateUp<cr>
noremap <silent> <C-l> :TmuxNavigateRight<cr>
noremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Same bindings, but for insert mode

inoremap <silent> <C-h> <C-o>:TmuxNavigateLeft<cr>
inoremap <silent> <C-j> <C-o>:TmuxNavigateDown<cr>
inoremap <silent> <C-k> <C-o>:TmuxNavigateUp<cr>
inoremap <silent> <C-l> <C-o>:TmuxNavigateRight<cr>
inoremap <silent> <C-\> <C-o>:TmuxNavigatePrevious<cr>

""""""""""""""""""""
" Multiple Cursors "
""""""""""""""""""""

let g:multi_cursor_exit_from_insert_mode = 0

""""""""""""""
"  NERDTree  "
""""""""""""""

noremap <Leader>cd :NERDTree<cr>

"""""""""""""
" Syntastic "
"""""""""""""

" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""
" Tagbar "
""""""""""

nmap <leader><leader>t :TagbarToggle<CR>

" Rust support
let g:tagbar_type_rust = {
	\ 'ctagstype' : 'rust',
	\ 'kinds' : [
		\'T:types,type definitions',
		\'f:functions,function definitions',
		\'g:enum,enumeration names',
		\'s:structure names',
		\'m:modules,module names',
		\'c:consts,static constants',
		\'t:traits',
		\'i:impls,trait implementations',
	\]
	\}

"""""""""""""
" Undo Tree "
"""""""""""""

nmap <leader>u :UndotreeToggle<cr>

let g:undotree_WindowLayout = 4
let g:undotree_SplitWidth = 32

""""""""""""
" Vim Wiki "
""""""""""""

let g:vimwiki_list = [{'path': '~/.vimwiki', 'path_html': '~/.vimwiki/html'}]

""""""""""""
" Vinarise "
""""""""""""

let g:vinarise_enable_auto_detect = 1
nmap <leader><leader>v :Vinarise<cr>

"""""""""""""""""
" YouCompleteMe "
"""""""""""""""""

let g:ycm_rust_src_path = '$HOME/.build/rust/src/rustc-1.20.0-src/'
