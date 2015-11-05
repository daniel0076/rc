#!/bin/sh
files=`env ls|grep -v "\."`
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


if [ ! -d $HOME/.vim/colors ];then
	mkdir $HOME/.vim/colors
fi
echo "copying vim molokai color scheme"
cp ./colors/molokai.vim $HOME/.vim/colors/

echo "initiating submodules"
cd "./zsh/zsh-git-prompt"
git submodule init
git submodule update
