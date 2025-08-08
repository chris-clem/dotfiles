# My dotfiles

## Setup
1. Clone repo into home

2. Run following steps

```bash
#!/usr/bin/env bash
set -euo pipefail

echo "Starting setup..."

# ─────────────────────────────────────────────────────────────
# Prerequisites
# ─────────────────────────────────────────────────────────────
echo "Installing core dependencies..."
sudo apt update || echo "Some repositories failed to update. Continuing anyway."
sudo apt install -y curl wget git zsh autojump

# ─────────────────────────────────────────────────────────────
# Set Zsh as default shell
# ─────────────────────────────────────────────────────────────
if ! command -v zsh &> /dev/null; then
    echo "Zsh installation failed or not found in PATH."
    exit 1
fi

if [ "$SHELL" != "$(which zsh)" ]; then
    if [ "$EUID" -ne 0 ]; then
        echo "Setting zsh as the default shell..."
        chsh -s "$(which zsh)" "$USER"
    else
        echo "Skipping chsh since script is running as root."
    fi
fi

# ─────────────────────────────────────────────────────────────
# Install Oh My Zsh
# ─────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    export RUNZSH=no
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ─────────────────────────────────────────────────────────────
# Install Zsh Plugins
# ─────────────────────────────────────────────────────────────
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

[[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]] && \
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

[[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]] && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# ─────────────────────────────────────────────────────────────
# Install Pure Prompt
# ─────────────────────────────────────────────────────────────
PURE_DIR="$HOME/.zsh/pure"
if [ ! -d "$PURE_DIR" ]; then
    echo "Installing pure prompt..."
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/sindresorhus/pure.git "$PURE_DIR"
fi

# ─────────────────────────────────────────────────────────────
# Install Awesome Vimrc
# ─────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.vim_runtime" ]; then
    echo "Installing awesome vimrc..."
    git clone --depth=1 https://github.com/amix/vimrc.git "$HOME/.vim_runtime"
    sh "$HOME/.vim_runtime/install_awesome_vimrc.sh"
fi

# ─────────────────────────────────────────────────────────────
# Install Oh My Tmux
# ─────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.tmux" ]; then
    echo "Installing oh-my-tmux..."
    git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"
    ln -sf "$HOME/.tmux/.tmux.conf" "$HOME/.tmux.conf"
    cp "$HOME/.tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"
fi

# ─────────────────────────────────────────────────────────────
# Install Pixi
# ─────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.pixi" ]; then
    echo "Installing pixi..."
    curl -fsSL https://pixi.sh/install.sh | bash
fi

# Ensure Pixi is in PATH
export PATH="$HOME/.pixi/bin:$PATH"

# ─────────────────────────────────────────────────────────────
# Install tools using Pixi
# ─────────────────────────────────────────────────────────────
echo "Installing CLI tools via Pixi..."
pixi global install gh
pixi global install dust
pixi global install nvtop

# ─────────────────────────────────────────────────────────────
# Install duf manually
# ─────────────────────────────────────────────────────────────
if ! command -v duf &> /dev/null; then
    echo "Installing duf..."
    DUF_DEB="duf_0.8.1_linux_amd64.deb"
    tmpdir=$(mktemp -d)
    pushd "$tmpdir" > /dev/null
    wget "https://github.com/muesli/duf/releases/download/v0.8.1/$DUF_DEB"
    sudo apt install -y ./"$DUF_DEB"
    popd > /dev/null
    rm -rf "$tmpdir"
fi

# ─────────────────────────────────────────────────────────────
# GitHub CLI Authentication
# ─────────────────────────────────────────────────────────────
if command -v gh &> /dev/null; then
    if ! gh auth status &> /dev/null; then
        echo "Starting GitHub authentication..."
        gh auth login || echo "GitHub CLI authentication failed or skipped."
    else
        echo "GitHub CLI already authenticated."
    fi
else
    echo "GitHub CLI (gh) not available. Skipping GitHub authentication."
fi

# ─────────────────────────────────────────────────────────────
# Clone dotfiles repository
# ─────────────────────────────────────────────────────────────
if command -v gh &> /dev/null && [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles..."
    gh repo clone chris-clem/dotfiles "$HOME/dotfiles"
fi

# ─────────────────────────────────────────────────────────────
# Symlink .zshrc
# ─────────────────────────────────────────────────────────────
echo "Setting up .zshrc symlink..."
if [ -L "$HOME/.zshrc" ] || [ -f "$HOME/.zshrc" ]; then
    rm -f "$HOME/.zshrc"
fi
ln -sfn "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

# ─────────────────────────────────────────────────────────────
# Final Message
# ─────────────────────────────────────────────────────────────
echo "Setup complete!"
echo "Run 'exec zsh' or restart your terminal to start using zsh."
```
