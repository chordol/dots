# dots

.init.vim and .tmux.conf files used with OS X 10.15.6, NVIM v0.4.4 and tmux 3.1b

## Setup

### Install tmux & zsh

.tmux file is assuming you are running zsh. If you're on OS X, I highly recommend it.  

For zsh, follow instruction from [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH), or just run:
```
brew install zsh
```

For tmux, follow instructions from [here](https://linuxize.com/post/getting-started-with-tmux/), or just run:
```
brew install tmux
```

### Install NeoVIM with fixings (fzf, silver searcher, vim plug, pyenv), and apply init.vim from this repo

```
brew install fzf # install FZF https://github.com/junegunn/fzf
$(brew --prefix)/opt/fzf/install # install useful key bindings and fuzzy completion
brew install the_silver_searcher # install silver searcher https://github.com/ggreer/the_silver_searcher
brew install pyenv # install pyenv https://github.com/pyenv/pyenv
cd ~
mkdir -p .config/nvim
rm .tmux.conf # remove current .tmux.conf
rm .config/nvim/init.vim # remove current .config/nvim/init.vim
brew install neovim
git clone https://github.com/chordol/dots
ln -s dots/.tmux.conf .tmux.conf
ln -s dots/init.vim .config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # install vim-plug https://github.com/junegunn/vim-plug
nvim -c PlugInstall # install neovim plugins
```
