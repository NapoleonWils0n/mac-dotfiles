# bash path
export PATH=$PATH:~/bin

# editor
export EDITOR="/usr/bin/vim"

# bash aliases
if [ -f "$HOME/.bash_aliases" ]; then
   . "$HOME/.bash_aliases"
fi

# git bash completion
if [ -f "$HOME/.git-completion.bash" ]; then
	. "$HOME/.git-completion.bash"
fi	

if [ -f "$HOME/.git-prompt.sh" ]; then
	. "$HOME/.git-prompt.sh"
fi

# kodi scripts
if [ -d "$HOME/git/kodi-playercorefactory/bash-scripts-macosx" ] ; then
        PATH="$HOME/git/kodi-playercorefactory/bash-scripts-macosx:$PATH"
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

# prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\nYes Master ? '

# cdpath
CDPATH=".:~"
