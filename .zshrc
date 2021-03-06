# Lines configured by zsh-newuser-install
# ssh zsh fix
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/djwilcox/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# directories
#============

# homebrew
export PATH="/usr/local/sbin:$PATH"

# home bin 
if [ -d "$HOME/bin" ]; then
   PATH="$HOME/bin:$PATH"
fi

# home local python bin 
if [ -d "$HOME/.local/bin" ]; then
   PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Library/Python/3.7/bin" ] ; then
        PATH="$HOME/Library/Python/3.7/bin:$PATH"
fi

# homebrew path
export PATH=/usr/local/bin:$PATH

# prompt
PS1=$'[%n@%M %~]\nYes Master ? '

# general
#========

# ranger dont load default
RANGER_LOAD_DEFAULT_RC="FALSE"

# tell ls to be colourfull
export LSCOLORS=ExFxCxDxBxegedabagacad
export CLICOLOR=1

# zstyle
#=======

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

# kill - red, green, blue
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=22=31=34'

# list optiones colour, white + cyan
zstyle ':completion:*:options' list-colors '=(#b) #(-[a-zA-Z0-9,]#)*(-- *)=36=37'

# rehash commands
zstyle ':completion:*' rehash true

# cdpath
setopt auto_cd
#cdpath=($HOME)
cdpath=(~)

# syntax highlighting
source "$HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
