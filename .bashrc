#
# Načítá se při spuštění bash
#

#
# Načtení formátu příkazového řádku
#
#PROMPT_COMMAND="source $HOME/vimfiles/.prompt.sh"

# Uprava pro praci s historii bash
# Neuklada do historie
#   ignorespace - neulozi prikazy zacinajici mezerou
#   ignoredups - neulozi duplicintni prikazy
#   ignoreboth - slucuje obe predchozi volby
#                duplicitni prikaz ulozi ale promaze prechozi vyskyt
#
HISTCONTROL=ignoreboth

# Neukladani vybranych prikazu
HISTIGNORE=ls:lls:ll:bc:clear:c:history:htop:pwd:git\ top:git\ init:git\ i:gi:git\ status:gs:git\ st:git\ add\ \.:ga:git\ commit:gc:git\ ca:git\ diffi:gd:git\ pull:git\ push:git\ l:gl:cd\ \.\.:cd:exit:mc:tree

# Nastaveni poctu ukladanych prikazu, nastaveni 0 vypne ukladani historie
HISTSIZE=10000

# Zapisuje se datum a cas pouziti prikazu 
#    y: dvouciferý rok
#    Y: čtyřciferný rok
#    m: dvouciferný měsíc
#    d: dvouciferný den v měsíci
#    T: čas ve 24hodinovém formátu
#    %r: datum s 12hodinovým časem
#    %D: datum ve formátu mm/dd/yy
HISTTIMEFORMAT="%h %d %H:%M:%S "

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
alias ll='ls -all'
alias c='clear'

