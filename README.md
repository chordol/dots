# dots

.init.vim and .tmux.conf files used with OS X 11.14.6, NVIM v0.4.2 and tmux 2.8

## Setup

### For tmux

.tmux is assuming you are running zsh. If you're on OS X, I highly recommend it.
```
# just run this script from the internet :) to install oh-my-zsh https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
brew install reattach-to-user-namespace # fix for copying on OS X
```

### For NVIM

```
brew install fzf # install FZF https://github.com/junegunn/fzf
$(brew --prefix)/opt/fzf/install # install useful key bindings and fuzzy completion
brew install the_silver_searcher # install silver searcher https://github.com/ggreer/the_silver_searcher
brew install pyenv # install pyenv https://github.com/pyenv/pyenv
cd ~
rm .tmux.conf
rm .config/nvim/init.vim
git clone https://github.com/chordol/dots
ln -s dots/.tmux.conf .tmux.conf
ln -s dots/init.vim .config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # install vim-plug https://github.com/junegunn/vim-plug
nvim -c PlugInstall # install neovim plugins
```
