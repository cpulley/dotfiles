# frmendez/geometry options
export PROMPT_GEOMETRY_GIT_TIME=false
export PROMPT_GEOMETRY_EXEC_TIME=true

export GEOMETRY_SYMBOL_PROMPT=" ◆ "                  # default prompt symbol
export GEOMETRY_SYMBOL_PROMPT2=" ⋄ "                 # multiline prompts
export GEOMETRY_SYMBOL_EXIT_VALUE=" ◇ "              # displayed when exit value is != 0
export GEOMETRY_SYMBOL_ROOT="«◆»"                    # when logged in user is root

export GEOMETRY_COLOR_EXIT_VALUE="red" # prompt symbol color when exit value is != 0
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

zplug 'zplug/zplug',       hook-build:'zplug --self-manage' # Let zplug update itself!

zplug "plugins/adb",       from:oh-my-zsh                   # adb completions
zplug "plugins/archlinux", from:oh-my-zsh                   # Handful of aliases for archlinux
zplug "plugins/git",       from:oh-my-zsh                   # Handful of aliases for git
zplug "plugins/vi-mode",   from:oh-my-zsh                   # Add more vim bindings to vimode
zplug "plugins/wd",        from:oh-my-zsh                   # Warp directory, may replace w/enhancd

zplug "frmendes/geometry"                                   # Nice theme

zplug "jreese/zsh-titles"                                   # Give titles to tmux sessions

zplug "horosgrisa/autoenv"                                  #

zplug "zsh-users/zsh-autosuggestions"                       # Fish-like suggestions
zplug "zsh-users/zsh-completions"                           # Whole bunch of completions
zplug "zsh-users/zsh-history-substring-search"              # Fish-like partial history search

zplug "zdharma/fast-syntax-highlighting", defer:2           # Faster and more colorful highlighting
zplug "zdharma/history-search-multi-word", defer:3          # Better ^R search

zplug "b4b4r07/zsh-vimode-visual", defer:3                  # Adds visual mode to vimode!
zplug "b4b4r07/enhancd",   use:init.sh                      # Fuzzy cd
export ENHANCD_DISABLE_DOT=1

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

######################################
#           _ _                      #
#     /\   | (_)                     #
#    /  \  | |_  __ _ ___  ___  ___  #
#   / /\ \ | | |/ _` / __|/ _ \/ __| #
#  / ____ \| | | (_| \__ \  __/\__ \ #
# /_/    \_\_|_|\__,_|___/\___||___/ #
#                                    #
######################################

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

########################################
#   _____                           _  #
#  / ____|                         | | #
# | |  __  ___ _ __   ___ _ __ __ _| | #
# | | |_ |/ _ \ '_ \ / _ \ '__/ _` | | #
# | |__| |  __/ | | |  __/ | | (_| | | #
#  \_____|\___|_| |_|\___|_|  \__,_|_| #
#                                      #
########################################

# Add ~/.scripts/ to path
PATH="$PATH:$HOME/.scripts/"

# Use vim instead of nano
export EDITOR="vim"

## Couple fixes for vimode, check the following for more information
## https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode#533685
# Set keytimeout to 0.01s
export KEYTIMEOUT=1
# Bind escape to undefined-key, fixes a big issue with low keytimeout
bindkey -M vicmd '^[' undefined-key

# Perl settings
# Automatically added by cpan, probably want to remove if you aren't me
PATH="/home/cpulley/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/cpulley/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/cpulley/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/cpulley/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/cpulley/.perl5"; export PERL_MM_OPT;
