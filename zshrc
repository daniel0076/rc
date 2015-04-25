#source other zsh configs

if [[ -f $HOME/rc/zsh/zsh.env ]];then
    source $HOME/rc/zsh/zsh.env
fi
if [[ -f $HOME/rc/zsh/zsh.prompt ]];then
    source $HOME/rc/zsh/zsh.prompt
fi
if [[ -f $HOME/rc/zsh/zsh.aliases ]];then
    source $HOME/rc/zsh/zsh.aliases
fi
if [[ -f $HOME/rc/zsh/screen.plugin.zsh ]];then
    source $HOME/rc/zsh/screen.plugin.zsh
fi
# The following lines were added by compinstall
autoload -Uz compinit
compinit

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select=2 # if there is more than 2 options,auto select the entries
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '/home/daniel/.zshrc'



# End of lines configured by zsh-newuser-install
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

#golang
export GOPATH=$HOME/Code/go

#bindkey from pi314 github repo
bindkey "\e[H" beginning-of-line
bindkey "\e[1~" beginning-of-line # for screen
bindkey "\eOH" beginning-of-line # for cygwin + mosh

bindkey "\e[F" end-of-line
bindkey "\e[4~" end-of-line # for screen
bindkey "\eOF" end-of-line # for cygwin + mosh
