# Uprava pro praci s historii bash
# Neuklada do historie
#   ignorespace - neulozi prikazy zacinajici mezerou
#   ignoredups - neulozi duplicintni prikazy
#   ignoreboth - slucuje obe predchozi volby
#   ignoreboth - duplicitni prikaz ulozi ale promeze prechozi vyskyt
#
HISTCONTROL=ignoreboth

# Neukladani vybranych prikazu
HISTIGNORE=ls:history:pwd

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

alias gi='git i'
alias ga='git add .'
alias gs='git status'
alias gc='git commit'

