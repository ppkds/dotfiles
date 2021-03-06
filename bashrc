# ~/.bashrc: executed by bash(1) for non-login shells.
# ॐ 
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Set path
PATH=$PATH:/usr/lib/i386-linux-gnu

# Set Locale
# LANG=/usr/lib/locale/en_US
# LANG=en_US.utf-8

# Convenience options

## Directory shell options
shopt -s cdable_vars
export dotfiles="/home/ppkds/Dev/Git/dotfiles"
export gitprojects="/home/ppkds/Dev/Git"
export documents="/home/ppkds/Documents"
export downloads="/home/ppkds/Downloads"
export pictures="/home/ppkds/Pictures"
export videos="/home/ppkds/video"

## Save multi-line commands as one command
shopt -s cmdhist

## Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

## Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

## check the window size after each command and if necessary update the values of LINES and COLUMNS.
shopt -s checkwinsize

# The pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
shopt -s globstar

## Automatically trim long paths in the prompt
PROMPT_DIRTRIM=2

## Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Set history length
HISTSIZE=10000
HISTFILESIZE=20000

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm | xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Enable color prompt for shell. Green for standard user, red for superuser
if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
#       PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]\[\033[01;34m\] \w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto -iE'
    alias ls='ls  --color=auto -ChF'
    alias vdir='vdir --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Use alias definitions file if it exists
if [ -f $HOME/.bashrc_aliases ]; then
    . $HOME/.bashrc_aliases
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

# Use display setup for WSL2 VcXsrv Xserver in WSL environment
if [ -f $HOME/.export_mod ]; then
    source $HOME/.export_mod
fi

# Export_mod files example
# export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
# export LIBGL_ALWAYS_INDIRECT=1

# Echo blankline before command prompt
PS1="\n$PS1"
