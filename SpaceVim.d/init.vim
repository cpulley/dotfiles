" Dark powered mode of SpaceVim, generated by SpaceVim automatically.
let g:spacevim_enable_guicolors = 0
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_statusline_separator = 'nil'
let g:spacevim_buffer_index_type = 4
let g:spacevim_enable_tabline_filetype_icon = 0

call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('core#statusline')
call SpaceVim#layers#load('core#tabline')
call SpaceVim#layers#load('default')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#sh')
call SpaceVim#layers#load('lang#swig')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('tags')
call SpaceVim#layers#load('tmux')
call SpaceVim#layers#load('tools#screensaver')

let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = []

if executable('vimlint')
    call add(g:neomake_vim_enabled_makers, 'vimlint') 
endif

if executable('vint')
    call add(g:neomake_vim_enabled_makers, 'vint') 
endif

if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif

let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''

" let g:spacevim_use_colorscheme='PaperColor'
let g:spacevim_colorscheme='PaperColor'
let g:spacevim_colorscheme_bg='light'

" Fix for the collision between multiple cursors & tmux-navigate
map <C-j> * :TmuxNavigateDown<CR>
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-m>'
let g:multi_cursor_quit_key='<Esc>'

let g:spacevim_custom_plugins = [
            \ ['vim-airline/vim-airline'],
            \ ['vim-airline/vim-airline-themes'],
            \ ]

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

set timeoutlen=200
