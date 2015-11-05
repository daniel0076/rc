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

echo "copying vim solarized color scheme"
if [ !-d $HOME/.vim/colors ];then
	mkdir $HOME/.vim/colors
	cp ./colors/solarized.vim $HOME/.vim/colors/
fi

echo "initiating submodules"
cd "./zsh/zsh-git-prompt"
git submodule init
git submodule update
