#source other zsh configs

if [[ -f $HOME/rc/zsh/zsh.env ]];then
    source $HOME/rc/zsh/zsh.env
fi
if [[ -f $HOME/rc/zsh/zsh.aliases ]];then
    source $HOME/rc/zsh/zsh.aliases
fi

#source all the plugins
for files in $HOME/rc/zsh/plugins/*;do
    source $files
done

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

bindkey "\e[3~" delete-char # for mac

# color prompt
#git status prompt

if [ -f $HOME/rc/zsh/zsh-git-prompt/zshrc.sh ]; then
    source $HOME/rc/zsh/zsh-git-prompt/zshrc.sh
fi

bindkey "^[[3~" delete-char

autoload -U colors
colors
b_yellow="%{$fg_bold[yellow]%}" #bold yellow
b_blue="%{$fg_bold[blue]%}"
b_cyan="%{$fg_bold[cyan]%}"
b_green="%{$fg_bold[green]%}"
b_white="%{$fg_bold[white]%}"
b_gray="%{$fg_bold[gray]%}"
b_magenta="%{$fg_bold[magenta]%}"
end="%{$reset_color%}"

function precmd()
{
PROMPT="${b_white}┌ %T - $end${b_cyan}%n${end}@ ${b_yellow}%m ${b_green}[%~]${end}     $(git_super_status)
${b_white}└ >$end"
}

