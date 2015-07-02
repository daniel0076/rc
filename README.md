RCs
===
This is repo for my rc settings

## Usage

### Install
+ `git clone https://github.com/daniel0076/rc.git` in you $HOME
+ execute `link.sh` , will auto link them to you $HOME
+ Modified the link in zshrc if you move .zsh to other places

### YomCompleteMe
Please see the [Installation DOC](https://github.com/Valloric/YouCompleteMe#installation)
Below are my settings

+ precompile the completion support
```
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --gocode-completer
```

+ need to set the conf location
```
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
```

+ If you want to use Syntastic, set diagnostics ui to 0, or it will turn off Syntastic
```
let g:ycm_show_diagnostics_ui = 0
```
I like Syntastic more, please refer the doc for more information about YCM syntastic support

### Syntastic
`:help syntastic` to get the document

---

## Change Log

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
