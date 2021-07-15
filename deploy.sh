#!/bin/sh

files=`env ls|grep -v "\."`
files="${files} tmux.conf"
dir=`env pwd`
echo "linking rc files into $HOME"
for f in $files;do
    if [ -L $HOME/.${f} ];then
        rm $HOME/.${f}
    fi
    env ln -s $dir/$f $HOME/.${f}
    if [ $? -eq 0 ];then
        echo ".$f linked"
    fi
done

echo "initiating submodules"
cd "./zsh/zsh-git-prompt"
git submodule init
git submodule update

if [ ! -d "$HOME/.oh-my-zsh/" ]
then
    echo "installing oh-my-zsh at home"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "linking my custom theme"
ln -s $dir/zsh/mytheme.zsh-theme $HOME/.oh-my-zsh/themes/
