#!/bin/sh
# My install script
# TODO
# ln -s "$(pwd)/psqlrc" "${HOME}/.psqlrc"
# ln -s "$(pwd)/tmux.conf" "${HOME}/.tmux.conf"
# ln -s "$(pwd)/powerline" "${HOME}/.config/"
# https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
# tic -x iterm/xterm-256color-italic.terminfo
# tic -x iterm/tmux-256color.terminfo

PACKAGES=vim zsh neovim python2-neovim python3-neovim

adn::install_packages() {
  echo "Installing packages $1"
  if command -v apt >/dev/null 2>&1 ; then
    apt install -y $1
  elif command -v dnf >/dev/null 2>&1 ; then
    dnf install -y $1
  fi
}

adn::package_manager() {
  if command -v apt >/dev/null 2>&1 ; then
    echo "apt"
  elif command -v dnf >/dev/null 2>&1 ; then
    echo "dnf"
  fi
}

adn::zsh() {
  echo "Installing zsh: version $(zsh --version)"
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  if [[ -e "~/.zshrc" ]] ; then
    "~/.zshrc"
    ln -s "$(pwd)/zsh/zshrc" "~/.zshrc"
  fi
  if [[ -e "~/.oh-my-zsh/themes/adn.zsh-theme" ]] ; then
    ln -s "$(pwd)/zsh/adn.zsh-theme" "~/.oh-my-zsh/themes/adn.zsh-theme"
  fi
}

adn::vim() {
  echo "Installing neovim"

  mkdir -p "~/.config/nvim"
  if [[ -e "~/.config/nvim/init.vim" ]] ; then
    rm "~/.config/nvim/init.vim"
    ln -s "$(pwd)/vimrc"  "~/.config/nvim/init.vim"
  fi
  if [[ -e "~/.ctags" ]] ; then
    ln -s "$(pwd)/ctags" "~/.ctags"
  fi
}

adn::fzf() {
  echo "Installing fzf"
  if ! adn::install_packages fzf ; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  fi
}

adn::rust() {
  if ! command -v cargo >/dev/null 2>&1 ; then
    curl https://sh.rustup.rs -sSf | sh
  fi
}

adn::ripgrep() {
  echo "Installing ripgrep"
  if ! adn::install_packages ripgrep ; then
    adn::rust
    cargo install ripgrep
  fi
}

adn::exa() {
  echo "Installing exa"
  adn::rust
  cargo install ripgrep
}

adn::install_packages $PACKAGES
adn::zsh
adn::fzf
adn::exa
adn::ripgrep
adn::vim
