# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#experiment
# Use variables set from terminfo capabilities to make PS1 and LESS_TERMCAP_*
# variables less cryptic.
#
# Colors: 0, Black; 1, Red; 2, Green; 3, Yellow; 4, Blue; 5, Magenta; 6, Cyan; 7, White.
# Foreground (text) colors
BLK=$(tput setaf 0)
RED=$(tput setaf 1)
GRN=$(tput setaf 2)
YEL=$(tput setaf 3)
BLU=$(tput setaf 4)
MAG=$(tput setaf 5)
CYA=$(tput setaf 6)
WHT=$(tput setaf 7)

# Background colors
BLKB=$(tput setab 0)
REDB=$(tput setab 1)
GRNB=$(tput setab 2)
YELB=$(tput setab 3)
BLUB=$(tput setab 4)
MAGB=$(tput setab 5)
CYAB=$(tput setab 6)
WHTB=$(tput setab 7)

# Character attibutes
BLD=$(tput bold)
ITA=$(tput sitm)
NOR=$(tput sgr 0)

#PS1='(\[$CYA\]$SHLVL\[$NOR\])[\[$YEL\]\j\[$NOR\]]\[$GRN\]\u\[$NOR\]@\[$BLD$GRN\]\h\[$NOR\]:\[$BLD$BLU\]\w $(__git_ps1 "\[$NOR\](\[$MAG\]\[$ITA\]%s\[$NOR\])")\n\[$BLD$WHT\]\$\[$NOR\] '
PS1='(\[$RED\]puts \[$CYA\]Hello!)\[$NOR\]\[$NOR\]:\[$BLD$BLU\]\w $(__git_ps1 "\[$NOR\](\[$MAG\]\[$ITA\]%s\[$NOR\])")\n\[$BLD$WHT\]\$\[$NOR\] '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set vim as editor
export EDITOR='vim'

# Change umask to make directory sharing easier
umask 0002
# Ignore duplicates in command history and increase
# history size to 1000 lines
export HISTCONTROL=ignoredups
export HISTSIZE=10000
# Add some helpful aliases
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto -h'

# Make tmux history more useable
PROMPT_COMMAND="history -a; history -c; history -r"

# Databases variables to make olumo work
export OLUMO_DATABASE_USER=sammy
export OLUMO_DATABASE_PASSWORD=password

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Use ripgrep with fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

# Installed fly cli
export FLYCTL_INSTALL="/home/kali/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Make Less utf-8 compliant
export LESSCHARSET=utf-8

# Helps cd-ing into dirs
export CDPATH=$HOME:$HOME/Documents
export CDPATH=$HOME:$HOME/Documents/current

# errata
export XKBVARIANT='English (programmer Dvorak ruby)'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# exporting POSTGRES creds so that I don't have to modify
# database.yml everytime.
export POSTGRES_USERNAME='ofn'
export POSTGRES_PASSWORD='f00d'
