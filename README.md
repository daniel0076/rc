RCs
===
This is repo for my rc settings

## Usage

### Install
+ `git clone https://github.com/daniel0076/rc.git` in you $HOME
+ execute `deploy.sh`, will auto deploy them to you $HOME
+ Modified the link in zshrc if you move .zsh to other places

### Components

+ .vimrc (with coc.nvim support)
+ zshrc (based on oh-my-zsh)
+ tmux

## Change Log

- 20210715
    - switch to coc.nvim
    - switch to tmux
    - switch to zsh, based on oh-my-zsh

- 20151105
	- fix `link.sh` commented bug
	- change vim color scheme to molokai
	- add vim color file copy in `link.sh`
	- fix vim and term color 256 problem
	- new screen status bar
	- new lscolor settings

- 20150704
    - fix [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt) display error when sceen is not activated
    - modified prompt display
    - add zsh-git-prompt to submodule
    - move plugins to `~/rc/zsh/plugins`
    - Plugins cloned from [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
        - sudo
        - screen

- 20150702
    - Change auto-completion plugin to [YouCompleteMe](https://github.com/Valloric/YouCompleteMe),previously using [Neocomplete](https://github.com/Shougo/neocomplete.vim) but it significantly becomes slow when the code grows
    - Change git intergration to [vim-fugitive](https://github.com/tpope/vim-fugitive), which is more powerful, go to it's website for more information and tutorial
    - Add [vim-gitgutter](https://github.com/airblade/vim-gitgutter) for git status indicator
    - Modified [Syntastic](https://github.com/scrooloose/syntastic) settings
    - Modified [vim-airline](https://github.com/bling/vim-airline) settings
    - remove Neocomplete (replaced with YCM)
    - remove vimproc,vim-marching (C/C++ Completion with neocomplete)
    - remove Neosnippet
    - remove jedi-vim (replaced with YCM)
    - remove emmet-vim (I don't need zen coding)


## Plugin list

+ 'Valloric/YouCompleteMe'
+ 'scrooloose/nerdtree'
+ 'scrooloose/nerdcommenter'
+ 'majutsushi/tagbar'
+ 'tpope/vim-fugitive'
+ 'bling/vim-airline'
+ 'fisadev/fisa-vim-colorscheme'
+ 'fisadev/FixedTaskList.vim'
+ 'michaeljsmith/vim-indent-object'
+ 'airblade/vim-gitgutter'
+ 'scrooloose/syntastic'
