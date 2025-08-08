# My dotfiles

## Setup
1. Clone repo into home

2. Run following steps

```bash
# Install zsh
sudo apt install zsh
sudo chsh -s $(which zsh) $USER
exec zsh

# Install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install autojump
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install pure
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Install basic awesome vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Install pixi
curl -fsSL https://pixi.sh/install.sh | sh

# Install GitHub CLI and authenticate
pixi global install gh
gh auth login

# Install dust
pixi global install dust

# Install nvtop
pixi global install nvtop

# Install duf
wget https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
sudo apt install ./duf_0.8.1_linux_amd64.deb

# Symlink .zshrc
rm ~/.zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
exec zsh
```
