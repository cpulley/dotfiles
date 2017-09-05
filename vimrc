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

Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy finding for files/buffers/etc
Plug 'Raimondi/delimitMate'           " Automated closing of parentheses/quotations
Plug 'yggdroot/indentline'            " Shows levels of indention
Plug 'scrooloose/nerdtree'            " File browser
Plug 'majutsushi/tagbar'              " Shows tags, ordered by scope, in a pane. (UNCONFIGURED)
Plug 'NLKNguyen/papercolor-theme'     " Bright theme
Plug 'scrooloose/syntastic'           " Syntax coloring for many different filetypes
Plug 'godlygeek/tabular'              " Simple but extensible alignment
Plug 'vim-airline/vim-airline'        " Replacement for powerline
Plug 'vim-airline/vim-airline-themes' " Themes for airline
Plug 'tpope/vim-commentary'           " Quick commenting
Plug 'fadein/vim-FIGlet'              " Quick ascii art
Plug 'tpope/vim-fugitive'             " Git wrapper
Plug 'airblade/vim-gitgutter'         " Show added/removed lines since last git commit
Plug 'terryma/vim-multiple-cursors'   " Multiple cursors
Plug 'sheerun/vim-polyglot'           " Also syntax coloring for many different filetypes
Plug 'mhinz/vim-startify'             " Fancy start menu
Plug 'tpope/vim-surround'             " Quick commands to surround words/lines
Plug 'christoomey/vim-tmux-navigator' " Vim-aware tmux movement
Plug 'vimwiki/vimwiki'                " Personal wiki, mostly for notes.

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

" Different keybinds for moving through tabs
map <silent> J :tabnext<cr>
map <silent> K :tabprev<cr>

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

""""""""""""
" Startify "
""""""""""""

let g:startify_custom_header = [
						\"        ________ ++     ________ 		",
						\"       /VVVVVVVV\++++  /VVVVVVVV\ 	",
						\"       \VVVVVVVV/++++++\VVVVVVVV/ 	",
						\"        |VVVVVV|++++++++/VVVVV/' 		",
						\"        |VVVVVV|++++++/VVVVV/' 		",
						\"       +|VVVVVV|++++/VVVVV/'+ 		",
						\"     +++|VVVVVV|++/VVVVV/'+++++ 		",
						\"   +++++|VVVVVV|/VVV___++++++++++ 	",
						\"     +++|VVVVVVVVVV/##/ +_+_+_+_ 		",
						\"       +|VVVVVVVVV___ +/#_#,#_#,\ 	",
						\"        |VVVVVVV//##/+/#/+/#/'/#/ 	",
						\"        |VVVVV/'+/#/+/#/+/#/ /#/ 		",
						\"        |VVV/'++/#/+/#/ /#/ /#/ 		",
						\"        'V/'  /##//##//##//###/ 		",
						\"                 ++ 					",
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

"Same bindings, but for insert mode

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

""""""""""""
" Vim Wiki "
""""""""""""

let g:vimwiki_list = [{'path': '~/.vimwiki', 'path_html': '~/.vimwiki/html'}]
