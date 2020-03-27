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

# Uprava pro praci s historii bash
# Neuklada do historie
#   ignorespace - neulozi prikazy zacinajici mezerou
#   ignoredups - neulozi duplicintni prikazy
#   ignoreboth - slucuje obe predchozi volby
#                duplicitni prikaz ulozi ale promaze prechozi vyskyt
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Neukladani vybranych prikazu
HISTIGNORE=ls:lls:ll:la:bc:clear:c:history:h:htop:pwd:git\ top:git\ init:git\ i:gi:git\ status:gs:git\ st:git\ add\ \.:ga:git\ commit:gc:git\ ca:git\ diffi:gd:git\ pull:git\ push:git\ l:gl:cd\ \.\.:cd:exit:mc:tree

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# Nastaveni poctu ukladanych prikazu, nastaveni 0 vypne ukladani historie
HISTSIZE=10000
HISTFILESIZE=2000

# Zapisuje se datum a cas pouziti prikazu 
#    y: dvouciferý rok
#    Y: čtyřciferný rok
#    m: dvouciferný měsíc
#    d: dvouciferný den v měsíci
#    T: čas ve 24hodinovém formátu
#    %r: datum s 12hodinovým časem
#    %D: datum ve formátu mm/dd/yy
HISTTIMEFORMAT="%h %d %H:%M:%S "

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

# Function for create prompt
getgitbranch() {
    git branch 2> /dev/null | grep "^\*" | cut -c3-
}

isgitclean() {
    test "" = "$(git status -s 2> /dev/null)"
    return $?
}

ROOT_UID=0

prompt_command() {
    END='\[\e[0m\]'
    RED='\[\e[31;1m\]'
    YELLOW='\[\e[33;1m\]'
    USER_COLOR='\[\e[0;32m\]'
    HISTORY_COLOR='\[\e[0;33m\]'
    DIR_COLOR='\[\e[0;32m\]'
    GIT_COLOR='\[\e[25;1m\]'
    PROMPT_COLOR='\[\e[1;34m\]'
    PC_COLOR='\[\e[31;1m\]'
    PROMPT=$?

    if ! isgitclean; then
        GIT_COLOR="\[\e[0;36m\]($(getgitbranch))"
    fi
    if [ ${UID} -eq ${ROOT_UID} ]; then
	    USER_COLOR='\[\e[1;31m\]'
        PROMPT_COLOR='\[\e[1;31m\]'
        PROMPT='#'
    fi
    if [[ $PROMPT -eq 0 ]]; then
        PROMPT="${YELLOW}\$"
    else
        PROMPT="${RED}\$"
    fi

    export PS1="[${USER_COLOR}\u${END}@${PC_COLOR}\h${END}] \t ${HISTORY_COLOR}\! ${DIR_COLOR}\w\n${GIT_COLOR}${PROMPT_COLOR}${PROMPT}${END} "
}
PROMPT_COMMAND=prompt_command

if [ "$color_prompt" = yes ]; then
    export PROMPT_COMMAND=prompt_command
    # pro milovníky pythonního interpreteru
    PS2="..."
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


#
# Pouzivane aliasy bash
#
alias gi='git i'
alias ga='git add .'
alias gs='git status'
alias gc='git commit'
alias gl='git l'
alias gd='git diff'
alias lls='ls'
alias c='clear'
alias h="history"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ok="ping google.com"
alias cs='cd;ls'

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
