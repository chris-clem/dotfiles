# My dotfiles

## Setup
1. Clone repo into home

2. Run following steps

```bash
# Update and install duf, nvtop, zsh
sudo apt update && sudo apt install duf nvtop zsh -y 

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo chsh -s "$(which zsh)" "$USER"

# Pure prompt
mkdir -p $HOME/.zsh && git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure

# Awesome vimrc
git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
sh $HOME/.vim_runtime/install_awesome_vimrc.sh

# Oh my tmux
cd $HOME && git clone --single-branch https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .

# Dotfiles for zshrc with plugins and pure enabled
git clone https://github.com/chris-clem/dotfiles.git $HOME/dotfiles
rm $HOME/.zshrc && ln -s $HOME/dotfiles/zshrc $HOME/.zshrc

# Start top tmux session with htop and nvtop
tmux new-session -s top -d \; send-keys 'htop' C-m \; split-window -h \; send-keys 'nvtop' C-m \;

# Add conda to zsh
conda init zsh

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
```
