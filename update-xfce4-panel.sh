#!/usr/bin/env bash

AUR=$(yay -Qua)
OFFICIAL=$(checkupdates)


stampa_arch=`echo -e "$OFFICIAL" | awk '{print "├", $0}'`
stampa_aur=`echo -e "$AUR" | awk '{print "├", $0}'`
if [ -z "$AUR" ] && [ -z "$OFFICIAL" ]
    then
    ALL=""
else
    AUR_N=$(yay -Qua | wc -l)
    OFFICIAL_N=$(checkupdates | wc -l )
    ALL=" "
    ALL+=$(( AUR_N + OFFICIAL_N )) 
    notify-send -i $HOME/Immagini/icone/pacman.png "Ci sono $(( AUR_N + OFFICIAL_N )) nuovi aggiornamenti" | paplay /usr/share/sounds/freedesktop/stereo/message.oga 
fi
# Panel
INFO="<txt>"
INFO+="${ALL}"
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="┌───────────────\n"
MORE_INFO+="├ ARCH\n${stampa_arch}"
MORE_INFO+="\n"├"\n├ AUR\n${stampa_aur}"
MORE_INFO+="\n└───────────────"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"