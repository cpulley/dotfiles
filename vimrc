""""""""""""""""""""""""""""
"   _____  _               "
"  |  __ \| |              "
"  | |__) | |_   _  __ _   "
"  |  ___/| | | | |/ _` |  "
"  | |    | | |_| | (_| |  "
"  |_|    |_|\__,_|\__, |  "
"                   |__/   "
"                          "
""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugins')

" let Vundle manage Vundle, required
Plug 'Lokaltog/vim-easymotion'         " More precise jumping/searching
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'  " Vim-aware tmux movement
Plug 'ervandew/supertab'               " Easy completion
Plug 'jistr/vim-nerdtree-tabs'         " 
Plug 'junegunn/vim-easy-align'         " Easy alignment
Plug 'airblade/vim-gitgutter'          " Show added/removed lines since last git commit
Plug 'majutsushi/tagbar'               " 
Plug 'mhinz/vim-startify' 			   " Fancy start menu
Plug 'yggdroot/indentline'             " Shows levels of indention
Plug 'scrooloose/nerdtree'             " 
Plug 'NLKNguyen/papercolor-theme'      " Bright theme
Plug 'scrooloose/syntastic'            " Syntax coloring for many different filetypes
Plug 'sheerun/vim-polyglot'            " Also syntax coloring for many different filetypes
Plug 'sjl/gundo.vim'                   " Binary Tree style undo
Plug 'vim-airline/vim-airline'         " Replacement for powerline
Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'terryma/vim-multiple-cursors'    " Multiple cursors
Plug 'tpope/vim-commentary'            " Quick commenting
Plug 'tpope/vim-fugitive'              " Git wrapper

call plug#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""
"   _____                           _  "
"  / ____|                         | | "
" | |  __  ___ _ __   ___ _ __ __ _| | "
" | | |_ |/ _ \ '_ \ / _ \ '__/ _` | | "
" | |__| |  __/ | | |  __/ | | (_| | | "
"  \_____|\___|_| |_|\___|_|  \__,_|_| "
"                                      "
""""""""""""""""""""""""""""""""""""""""

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
set ttymouse=xterm2

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _    _ _____   _______                 _         "
" | |  | |_   _| |__   __|               | |        "
" | |  | | | |      | |_      _____  __ _| | _____  "
" | |  | | | |      | \ \ /\ / / _ \/ _` | |/ / __| "
" | |__| |_| |_     | |\ V  V /  __/ (_| |   <\__ \ "
"  \____/|_____|    |_| \_/\_/ \___|\__,_|_|\_\___/ "
"                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better color, please.
 set t_Co=256
 colorscheme PaperColor

" Pretty theme setup.
set laststatus=2
set noshowmode
set background=light

" Shorten indentions
set tabstop=4


" Gvim tweaks
set guifont=Hack\ 7
set guioptions=aig

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _    ___   __  _______                 _         "
" | |  | \ \ / / |__   __|               | |        "
" | |  | |\ V /     | |_      _____  __ _| | _____  "
" | |  | | > <      | \ \ /\ / / _ \/ _` | |/ / __| "
" | |__| |/ . \     | |\ V  V /  __/ (_| |   <\__ \ "
"  \____//_/ \_\    |_| \_/\_/ \___|\__,_|_|\_\___/ "
"                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _____  _             _          ____        _   _                  "
" |  __ \| |           (_)        / __ \      | | (_)                 "
" | |__) | |_   _  __ _ _ _ __   | |  | |_ __ | |_ _  ___  _ __  ___  "
" |  ___/| | | | |/ _` | | '_ \  | |  | | '_ \| __| |/ _ \| '_ \/ __| "
" | |    | | |_| | (_| | | | | | | |__| | |_) | |_| | (_) | | | \__ \ "
" |_|    |_|\__,_|\__, |_|_| |_|  \____/| .__/ \__|_|\___/|_| |_|___/ "
"                 |___/                 |_|                           "
"                                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""
" Airline "
"""""""""""

" Use fancy fonts
let g:airline_powerline_fonts = 1

" Use powerlineish theme
let g:airline_theme='papercolor'

""""""""""""""
" Easy-align "
""""""""""""""

nmap <Leader>ea <Plug>(EasyAlign)
xmap <Leader>ea <Plug>(EasyAlign)

""""""""""""""
" Easymotion "
""""""""""""""

" Disable default mappings
let g:EasyMotion_do_mapping = 0 

" This makes easymotion use <leader> instead of <leader><leader>
map <Leader> <Plug>(easymotion-prefix)

" Bi-directional find motion
nmap f <Plug>(easymotion-s2)

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" Also, let's just replace the default vim search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Intelligent case sensitivity in easymotion
" v = v & V, but V only = V
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

"""""""""
" Gundo "
"""""""""

" Session version control / smart undo
nnoremap <leader>u :GundoToggle<CR>

" Set some Gundo asthetics
let g:gundo_width = 80
let g:gundo_preview_height = 15
let g:gundo_right = 1
let g:gundo_help = 0
let g:gundo_close_on_revert = 1

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
