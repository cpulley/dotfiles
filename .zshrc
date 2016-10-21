###########################################
#                 _   _                   #
#     /\         | | (_)                  #
#    /  \   _ __ | |_ _  __ _  ___ _ __   #
#   / /\ \ | '_ \| __| |/ _` |/ _ \ '_ \  #
#  / ____ \| | | | |_| | (_| |  __/ | | | #
# /_/    \_\_| |_|\__|_|\__, |\___|_| |_| #
#                       |___/             #
#                                         #
###########################################
source /home/cpulley/.antigen/antigen.zsh

antigen bundle adb
antigen bundle archlinux
antigen bundle git
antigen bundle vi-mode

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

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

# Following are ripped from oh-my-zsh's common-aliases plugin
alias ls='ls --color'
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

# Replace less with vimpager
alias less='vimpager'

# labs and laur to download repo and aur build files to ~/.build, respectively
# (Local ABS, Local AUR)
alias labs='ABSROOT=~/.build abs'
alias laur='cower -ft ~/.build/local -d'

# Easily update the mirrorlist
alias reflect='sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.prereflect && sudo reflector --threads 5 -p https -c US --sort score -n 10 --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist | grep -v \#\#'

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
export TERM=xterm-termite
[ -n "$TMUX" ] && export TERM=tmux

# Perl settings
# Automatically added by cpan
PATH="/home/cpulley/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/cpulley/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/cpulley/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/cpulley/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/cpulley/.perl5"; export PERL_MM_OPT;

# Pretty startup screen
clear && archey3
