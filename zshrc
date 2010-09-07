zmodload -a colors
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/nate/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
# End of lines configured by zsh-newuser-install


################################################
# sleepynate's mods
################################################

# fix home/end keys
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[6~' down-line-or-search
bindkey '\e[5~' up-line-or-search
bindkey '\e[3~' delete-char

#dude... vi mode.
setopt VI

# color prompt
PS1="%F{green}%m%F{white}:%F{yellow}%~%F{white}%% "
#RPROMPT='[%T]'

# add a personal directory for utilities
PATH=$PATH:$HOME/.bin

# convenient aliases
#
# update all version-controlled stuff
alias allcvs="for i in $HOME"'/workspace/[!D]* ; do
    cd $i;
	if [ -d .svn ] ;
		then echo; echo updating $i;
		svn st && svn up;
	elif [ -d .git ] ; 
		then echo; echo pulling $i;
		git status && git pull;
	elif [ -d .bzr ] ; 
		then echo; echo pulling $i;
		bzr status --versioned && bzr pull;
	elif [ -d _darcs ] ; 
		then echo; echo pulling $i;
		darcs what -ls && darcs pull;
	fi
done
cd '
alias tmux='tmux -2 attach'
alias ls='ls -F --color=auto'

export CLASSPATH=/opt/clojure:/opt/clojure-contrib:/usr/share/java/
export CLOJURE_EXT=/opt/clojure:/opt/clojure-contrib:/usr/share/java/
PATH=$PATH:/opt/clojure-contrib/launchers/bash
alias clj=clj-env-dir

