###################################################
#   ____  _       __  __         ______    _      #
#  / __ \| |     |  \/  |       |___  /   | |     #
# | |  | | |__   | \  / |_   _     / / ___| |__   #
# | |  | | '_ \  | |\/| | | | |   / / / __| '_ \  #
# | |__| | | | | | |  | | |_| |  / /__\__ \ | | | #
#  \____/|_| |_| |_|  |_|\__, | /_____|___/_| |_| #
#                         __/ |                   #
#                        |___/                    #
###################################################

# Path to your oh-my-zsh installation.
export ZSH=/home/cpulley/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(adb archlinux common-aliases cp git vi-mode wd)

source $ZSH/oh-my-zsh.sh

################################################
#  _____                       _ _             #
# |  __ \                     | (_)            #
# | |__) |____      _____ _ __| |_ _ __   ___  #
# |  ___/ _ \ \ /\ / / _ \ '__| | | '_ \ / _ \ #
# | |  | (_) \ V  V /  __/ |  | | | | | |  __/ #
# |_|   \___/ \_/\_/ \___|_|  |_|_|_| |_|\___| #
#                                              #
################################################

. /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# Properly align right prompt
ZLE_RPROMPT_INDENT=0
precmd() { RPROMPT="" }

# Print newline after each command
precmd() { print " " }

######################################
#           _ _                      #
#     /\   | (_)                     #
#    /  \  | |_  __ _ ___  ___  ___  #
#   / /\ \ | | |/ _` / __|/ _ \/ __| #
#  / ____ \| | | (_| \__ \  __/\__ \ #
# /_/    \_\_|_|\__,_|___/\___||___/ #
#                                    #
######################################

# Replace less with vimpager
alias less='vimpager'

# I like common-aliases bindings, but /fuck/ interactive mode
alias rm='rm'
alias mv='mv'
alias cp='cp'

# dlpkg and aurpkg to download repo and aur build files, respectively
alias dlpkg='ABSROOT=~/.build abs'
alias aurpkg='cower -ft ~/.build/local -d'

#######################################
#   _____ _   _ _    _ _____   _____  #
#  / ____| \ | | |  | |  __ \ / ____| #
# | |  __|  \| | |  | | |__) | |  __  #
# | | |_ | . ` | |  | |  ___/| | |_ | #
# | |__| | |\  | |__| | |    | |__| | #
#  \_____|_| \_|\____/|_|     \_____| #
#                                     #
#######################################                                    

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

########################################
#   _____                           _  #
#  / ____|                         | | #
# | |  __  ___ _ __   ___ _ __ __ _| | #
# | | |_ |/ _ \ '_ \ / _ \ '__/ _` | | #
# | |__| |  __/ | | |  __/ | | (_| | | #
#  \_____|\___|_| |_|\___|_|  \__,_|_| #
#                                      #
########################################

# Use vimpager instead of less
export PAGER="vimpager"

# Use vim instead of nano
export EDITOR="vim"

# Try to fix vim's 256color mode when tmux is running
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Perl settings
# Automatically added by cpan
PATH="/home/cpulley/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/cpulley/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/cpulley/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/cpulley/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/cpulley/.perl5"; export PERL_MM_OPT;

# Pretty startup screen
clear && archey3
