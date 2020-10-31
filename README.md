# dots

.init.vim and .tmux.conf files used with OS X 11.15.3, NVIM v0.4.3 and tmux 3.0a

## Setup

### For tmux & zsh

.tmux is assuming you are running zsh. If you're on OS X, I highly recommend it.  

For zsh, follow instruction from [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).  

For tmux, follow instructions from [here](https://linuxize.com/post/getting-started-with-tmux/).

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
