# My dotfiles

## Setup
1. Clone repo into home

2. Check if zsh is setup: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

3. Install Oh My Zsh
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Install pure prompt
```sh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

5. Create simlinks
```shell
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
source .zshrc
```

6. Install [Oh My Tmux](https://github.com/gpakosz/.tmux)
```shell
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

