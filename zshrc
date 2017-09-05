# frmendez/geometry options
export PROMPT_GEOMETRY_GIT_TIME=false
export PROMPT_GEOMETRY_EXEC_TIME=true

export GEOMETRY_SYMBOL_PROMPT="  ◆ "                  # default prompt symbol
export GEOMETRY_SYMBOL_RPROMPT="  ⋄ "                 # multiline prompts
export GEOMETRY_SYMBOL_EXIT_VALUE="  ◇ "              # displayed when exit value is != 0
export GEOMETRY_SYMBOL_ROOT=" «◆»"                    # when logged in user is root

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

zplug "plugins/adb",                            from:oh-my-zsh # adb completions
zplug "plugins/archlinux",                      from:oh-my-zsh # Handful of aliases for archlinux
zplug "horosgrisa/autoenv"                                     #
zplug "b4b4r07/enhancd",                        use:init.sh    # Fuzzy cd
zplug "zdharma/fast-syntax-highlighting",       defer:2        # Faster and more colorful highlighting
zplug "ytet5uy4/fzf-widgets"                                   # Add fzf searching for various things
zplug "frmendes/geometry"                                      # Nice theme
zplug "plugins/git",                            from:oh-my-zsh # Handful of aliases for git
zplug "plugins/vi-mode",                        from:oh-my-zsh # Add more vim bindings to vimode
zplug "plugins/wd",                             from:oh-my-zsh # Warp directory, may replace w/enhancd
zplug "zsh-users/zsh-autosuggestions"                          # Fish-like suggestions
zplug "zsh-users/zsh-completions"                              # Whole bunch of completions
zplug "zsh-users/zsh-history-substring-search", defer:3        # Fish-like partial history search
zplug "jreese/zsh-titles"                                      # Give titles to tmux sessions
zplug "b4b4r07/zsh-vimode-visual",              defer:3        # Adds visual mode to vimode!

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
export ENHANCD_DISABLE_DOT=1 # Let "cd .." just go back
export ENHANCD_FILTER=fzf    # Use fzf instead of fzf-tmux

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
export HISTFILE="$HOME/.zsh_history"
export SAVEHSIT="10000"

# Make fzf not be fullscreen
export FZF_DEFAULT_OPTS='--height 40%'

#####################################
#     _    _ _                      #
#    / \  | (_) __ _ ___  ___  ___  #
#   / _ \ | | |/ _` / __|/ _ \/ __| #
#  / ___ \| | | (_| \__ \  __/\__ \ #
# /_/   \_\_|_|\__,_|___/\___||___/ #
#                                   #
#####################################

# Following are ripped from oh-my-zsh's common-aliases plugin
alias ls='ls --color --time-style long-iso'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Replace vim with nvim (muscle memory is hard to fix)
alias vim='nvim'

# List explicitly installed packages
alias paclsexplicit="pacman -Qe | pacman -Qi | grep 'Name\|Description' | cut -d \: -f 2 | awk ' {print;} NR % 2 == 0 { print "\n"; }' | less"

# Use pacmatic as wrapper for pacaur
function up(){
	CURRENT_UID=$UID
	pacman_program="sudo -u #$CURRENT_UID" sudo -s eval "pacmatic -Syu $@ && paccache -r -k 2"
}


