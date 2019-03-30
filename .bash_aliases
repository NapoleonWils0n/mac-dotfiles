# bash aliases
#=============

# synergy
alias synergyc="$HOME/Applications/Synergy.app/Contents/MacOS/synergyc"
alias synergys="$HOME/Applications/Synergy.app/Contents/MacOS/synergyc"

# wget - enable continue and set the user agent
alias wget='wget --user-agent="Mozilla" -c'

alias curl='curl -A "Mozilla"'

# mkdir check if dir exists
alias mkdir='mkdir -p'

# emacs
#======

alias emacs='emacs -nw'

# git aliases
#============

# git
alias g='git'

# git add
alias ga='git add'

# git commit
alias gc='git commit -a'

# git move
alias gm='git mv'

# git push origin master
alias gpom='git push origin master'

# git push ssh master
alias gpsm='git push ssh master'

# git push github master
alias gpgm='git push github master'

# git push nas master
alias gpnm='git push nas master'

# git push drive master, push to usb drive
alias gpdm='git push drive master'

# git remove
alias gr='git rm'

# git status
alias gs='git status'

# git log
alias gl='git log --oneline --all --graph --decorate'

# git pull
alias gp='git pull'

# functions
#==========

# convert magnet link to torrent
#===============================

# mag2torrent
function mag2torrent {
aria2c --bt-metadata-only=true --bt-save-metadata=true --listen-port=6881 "$1"
}


# youtube-dl vlc function
#========================

# vlc youtube-dl
function youtube-vlc {
vlc $(youtube-dl -g "$1") &>/dev/null
}

# mplayer youtube-dl
function youtube-mplayer {
curl --ciphers RC4-SHA $(youtube-dl -g "$1") | mplayer -cache 8192 -
}
