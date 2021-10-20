# My dotfiles

## Setup
1. Clone repo into home

2. Check if zsh is setup: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

3. Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Install [autojump](https://github.com/wting/autojump)
```bash
sudo apt install autojump
```

5. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

6. Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

7. Install [Pure](https://github.com/sindresorhus/pure)
```bash
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

8. Install [vimrc](https://github.com/amix/vimrc)
```bash
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

9. Create simlinks
```bash
rm ~/.zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
exec zsh
```

9. Install [Oh My Tmux](https://github.com/gpakosz/.tmux)
```bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```
