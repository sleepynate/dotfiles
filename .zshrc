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
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# weirder terminals
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 

#dude... vi mode.
setopt VI

# color prompt
PS1="%F{green}%m%F{none}:%F{yellow}%~%F{none}%% "
#RPROMPT='[%T]'

# add a personal directory for utilities
PATH=$PATH:$HOME/.bin

# convenient aliases and functions
#
# update all version-controlled stuff
allcvs ()  {
	for i in $HOME/workspace/* ; do
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
	cd
}

ssh-tarcp () {
	if [ $# -ne 2 ]
	then
		print "Usage: $0 [files-to-move] [user@remotehost]"
	else
	    tar zcf - $1 | ssh $2 'tar zxf -'
	fi
}

# force tmux to always attach the same session and run in 256 color
alias tmux='tmux -2 attach'
alias ls='ls -F --color=auto'
alias ack='ack --color-filename=blue'

# give in to the fact that i type faster than i think and i'm usually in vim
alias :o=vim
alias :e=vim
alias :q=exit
alias phppp='php_beautifier -l "ArrayNested phpBB()"'

#java's dependence on path environment variables drives me nuts
export CLASSPATH=/opt/clojure:/opt/clojure-contrib:/usr/share/java/
export CLOJURE_EXT=/opt/clojure:/opt/clojure-contrib:/usr/share/java/
PATH=$PATH:/opt/clojure-contrib/launchers/bash
alias clj=clj-env-dir

