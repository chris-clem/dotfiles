# My dotfiles

## Setup
1. Clone repo into home
2. Check if zsh is setup: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
3. Install Oh My Zsh
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Install pure prompt
```shell
npm install --global pure-prompt
```
5. Create simlinks
```shell
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
source .zshrc
```
