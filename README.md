# My dotfiles

## Setup
1. Clone repo into home

2. Check if zsh is setup: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

3. Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Install [Pure](https://github.com/sindresorhus/pure)
```bash
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

5. Create simlinks
```bash
rm ~/.zshrc
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
source .zshrc
```

6. Install [Oh My Tmux](https://github.com/gpakosz/.tmux)
```bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```
