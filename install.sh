#!/usr/bin/env bash
set -e

today=$(date +%m.%d.%Y)
DOTFILES_DIR="$HOME/dotfiles"

# --- Symlink dotfiles ---
symlinks=(.tmux.conf .vimrc .zshrc .gitconfig)

for link in "${symlinks[@]}"; do
  if [ -f "$HOME/${link}" ] && [ ! -L "$HOME/${link}" ]; then
    echo "$HOME/${link} exists as a file, backing up to ${link}.${today}"
    mv "$HOME/${link}" "$HOME/${link}.${today}"
  fi
  echo "Symlinking ${link} -> $HOME/${link}"
  if [ -L "$HOME/${link}" ]; then
    unlink "$HOME/${link}"
  fi
  ln -s "${DOTFILES_DIR}/${link}" "$HOME/${link}"
done

# --- Ghostty config symlink ---
echo "Symlinking ghostty/config -> ~/.config/ghostty/config"
mkdir -p "$HOME/.config/ghostty"
if [ -f "$HOME/.config/ghostty/config" ] && [ ! -L "$HOME/.config/ghostty/config" ]; then
  echo "$HOME/.config/ghostty/config exists, backing up"
  mv "$HOME/.config/ghostty/config" "$HOME/.config/ghostty/config.${today}"
fi
if [ -L "$HOME/.config/ghostty/config" ]; then
  unlink "$HOME/.config/ghostty/config"
fi
ln -s "${DOTFILES_DIR}/ghostty/config" "$HOME/.config/ghostty/config"

# --- Shell check ---
if [[ $SHELL != *"zsh"* ]]; then
  echo "Doesn't look like your shell is zsh, you may want to swap it"
  echo "ex, chsh -s /bin/zsh"
fi

# --- tmux check ---
if ! command -v tmux &>/dev/null; then
  echo "Doesn't look like tmux is installed, you should install it"
fi

# --- vim-plug ---
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Installing vim-plug..."
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "vim-plug installed. Run :PlugInstall in vim to install plugins."
fi

# --- TPM (tmux plugin manager) ---
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM (tmux plugin manager)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  echo "TPM installed. Press prefix + I inside tmux to install plugins."
fi

# --- Brew dependencies ---
if command -v brew &>/dev/null; then
  echo ""
  echo "Installing brew dependencies..."
  brew install fzf zoxide eza bat ripgrep fd git-delta zsh-autosuggestions zsh-syntax-highlighting 2>/dev/null || true
else
  echo ""
  echo "Homebrew not found. Install these manually:"
  echo "  brew install fzf zoxide eza bat ripgrep fd git-delta zsh-autosuggestions zsh-syntax-highlighting"
fi

echo ""
echo "Done! Next steps:"
echo "  1. Open Ghostty (install JetBrains Mono font if needed: brew install --cask font-jetbrains-mono)"
echo "  2. Start tmux and press prefix + I to install tmux plugins"
echo "  3. Restart your shell to pick up zsh changes"
