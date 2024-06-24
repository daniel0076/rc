#!/bin/sh

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

echo "initiating submodules"
pushd "$ZSH_DIR" &> /dev/null
git submodule update --init --recursive
popd &> /dev/null

popd &> /dev/null
