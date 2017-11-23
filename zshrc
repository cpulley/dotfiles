# frmendez/geometry options
export PROMPT_GEOMETRY_GIT_TIME=false
export PROMPT_GEOMETRY_EXEC_TIME=true

export GEOMETRY_SYMBOL_PROMPT="  "                  # default prompt symbol
export GEOMETRY_SYMBOL_RPROMPT="  "                 # multiline prompts
export GEOMETRY_SYMBOL_EXIT_VALUE="  "              # displayed when exit value is != 0
export GEOMETRY_SYMBOL_ROOT="  "                   # when logged in user is root

export GEOMETRY_COLOR_EXIT_VALUE="white" # prompt symbol color when exit value is != 0
export GEOMETRY_COLOR_PROMPT="white" # prompt symbol color
export GEOMETRY_COLOR_ROOT="white" # root prompt symbol color
export GEOMETRY_COLOR_DIR="blue" # current directory color

export PROMPT_GEOMETRY_COLORIZE_ROOT=true

##############################
#  _________  _              #
# |__  /  _ \| |_   _  __ _  #
#   / /| |_) | | | | |/ _` | #
#  / /_|  __/| | |_| | (_| | #
# /____|_|   |_|\__,_|\__, | #
#                     |___/  #
##############################
#
source "$HOME/.zplug/init.zsh"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'          # Let zplug update itself!

zplug "horosgrisa/autoenv"                                  #
zplug "b4b4r07/enhancd",                        use:init.sh # Fuzzy cd
zplug "fabiokiatkowski/exercism.plugin.zsh"                 # Excercism.io tool--Programming challenges
zplug "zdharma/fast-syntax-highlighting",       defer:2     # Faster and more colorful highlighting
zplug "ytet5uy4/fzf-widgets"                                # Add fzf searching for various things
zplug "frmendes/geometry"                                   # Nice theme
zplug "sharat87/zsh-vim-mode"                               # Better vim bindings (sans OMZ!)
zplug "zsh-users/zsh-autosuggestions"                       # Fish-like suggestions
zplug "zsh-users/zsh-completions"                           # Whole bunch of completions
zplug "zsh-users/zsh-history-substring-search", defer:3     # Fish-like partial history search
zplug "jreese/zsh-titles"                                   # Give titles to tmux sessions
zplug "b4b4r07/zsh-vimode-visual",              defer:3     # Adds visual mode to vimode!

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

################################################################
#  ____  _             _          ____             __ _        #
# |  _ \| |_   _  __ _(_)_ __    / ___|___  _ __  / _(_) __ _  #
# | |_) | | | | |/ _` | | '_ \  | |   / _ \| '_ \| |_| |/ _` | #
# |  __/| | |_| | (_| | | | | | | |__| (_) | | | |  _| | (_| | #
# |_|   |_|\__,_|\__, |_|_| |_|  \____\___/|_| |_|_| |_|\__, | #
#                |___/                                  |___/  #
################################################################

# enhancd
export ENHANCD_DISABLE_DOT=1    # Let "cd .." just go back
export ENHANCD_DISABLE_HYPHEN=1 # Same, but with "cd -"
export ENHANCD_FILTER=fzf       # Use fzf instead of fzf-tmux

# fzf-widgets
bindkey '^R' fzf-insert-history # Use ^R for fuzzy history search

# zsh-history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=default,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'

#######################################
#   ____                           _  #
#  / ___| ___ _ __   ___ _ __ __ _| | #
# | |  _ / _ \ '_ \ / _ \ '__/ _` | | #
# | |_| |  __/ | | |  __/ | | (_| | | #
#  \____|\___|_| |_|\___|_|  \__,_|_| #
#                                     #
#######################################

# Add ~/.scripts/ to path
PATH="$PATH:$HOME/.scripts/"

# Use vim instead of nano
export EDITOR="vim"

# Keep history a-la oh-my-zsh
setopt inc_append_history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE="4096"
export SAVEHSIT="4096"

# Make fzf not be fullscreen
export FZF_DEFAULT_OPTS='--height 40% --reverse --color=bg+:254,fg+:238,hl+:26,hl:26,fg:243,prompt:240,pointer:240'

# Make hitting escape more responsive with vimode
export KEYTIMEOUT=1

#####################################
#     _    _ _                      #
#    / \  | (_) __ _ ___  ___  ___  #
#   / _ \ | | |/ _` / __|/ _ \/ __| #
#  / ___ \| | | (_| \__ \  __/\__ \ #
# /_/   \_\_|_|\__,_|___/\___||___/ #
#                                   #
#####################################

# Cargo
alias cb='cargo build'
alias cbr='cargo build --release'
alias cr='cargo run'
alias crr='cargo run --release'
alias cs='cargo search'

# Git
alias ga='git add'
alias gap='git add -p'
alias gc='git commit -v'
alias gcp='git commit -vp'
alias gca='git commit -va'
alias gcm='git checkout master'
alias gd='git diff'
alias gst='git status'
alias gp='git push'

# Grep
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# ls
alias l='ls -lFh'     #size,show type,human readable
alias lS='ls -1FSsh'
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lart='ls -1Fcart'
alias ldot='ls -ld .*'
alias ll='ls -l'      #long list
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lrt='ls -1Fcrt'
alias ls='ls --color --time-style long-iso'
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable

# Pacman
alias pacls='pacman -Qi | grep "Name\|Description" | cut -d \: -f 2 | awk " {print;} NR % 2 == 0 { print "\n"; }"'
alias paclsexplicit='pacman -Qe | pacman -Qi | grep "Name\|Description" | cut -d \: -f 2 | awk " {print;} NR % 2 == 0 { print "\n"; }" | less'
alias paclsorphans='sudo pacman -Qdt  | pacman -Qi | grep "Name\|Description" | cut -d \: -f 2 | awk " {print;} NR % 2 == 0 { print "\n"; }"'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'

# Replace vim with nvim (muscle memory is hard to fix)
alias vim='nvim'

# Use pacmatic as wrapper for pacaur
function up(){
	CURRENT_UID=$UID
	sudo pacman_program="sudo -u #$UID pacaur" pacmatic -Syu $@ && sudo paccache -r -k 2
}
