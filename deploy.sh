#!/bin/bash

SCRIPT_DIR="$(realpath $(dirname "$0"))"
pushd "$SCRIPT_DIR" &> /dev/null || exit
echo "cd to $SCRIPT_DIR"

ZSH_DIR="$SCRIPT_DIR/zsh"

files="vimrc zshrc gitconfig tmux.conf"
echo "linking rc files into $HOME"
for f in $files;do
    if [ -f $HOME/.${f} ];then
        rm $HOME/.${f}
    fi
    env ln -s "$SCRIPT_DIR/$f" "$HOME/.${f}"
    if [ $? -eq 0 ];then
        echo ".$f linked"
    fi
done

echo "linking nvim files into .config"
if [ ! -d $HOME/.config ];then
    mkdir $HOME/.config
fi
if [ -d $HOME/.config/nvim ];then
    rm -rf $HOME/.config/nvim
fi
env ln -s "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"

echo "initiating submodules"
pushd "$ZSH_DIR" &> /dev/null
git submodule update --init --recursive
popd &> /dev/null

echo "installing fzf" # for vim and zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

popd &> /dev/null
