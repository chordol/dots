# dots

.init.vim and .tmux.conf files used with OS X 14.1.1, NVIM v0.9.4 and tmux 3.3.a

## Setup

### Install tmux & zsh

.tmux file is assuming you are running zsh. If you're on OS X, I highly recommend it.  

For zsh, follow instruction from [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH), or just run:
```
brew install zsh
```

Install oh-my-zsh ([link](https://ohmyz.sh/#install))
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

For tmux, follow instructions from [here](https://linuxize.com/post/getting-started-with-tmux/), or just run:
```
brew install tmux
```

### Install NeoVIM, fzf, silver searcher, pyenv

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
```
### Symlink dot files

Type in your user name.
```
ln -s /Users/[user name]/dots/.tmux.conf /Users/[user name]/.tmux.conf
ln -s /Users/[user name]/dots/init.vim /Users/[user name]/.config/nvim/init.vim
```

### Install vim-plug and install all the plugins

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall # install neovim plugins
```
