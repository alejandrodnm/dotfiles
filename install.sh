#!/bin/sh

# My install script
# https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be

main() {
  install_brewfile
  install_git
  install_tmux
  install_psqlrc
  install_kitty
  install_zsh
  install_node
  install_rust
  install_vim
  install_golang
  install_postgres
  install_navi
  install_completitions
  install_ssh_config
}

install_ssh_config() {
  mkdir ~/.ssh/sockets

  if [ -e "${HOME}/.ssh/config" ] || [ -L "${HOME}/.ssh/config" ]; then
    rm "${HOME}/.ssh/config"
  fi
  ln -s "${PWD}/kitty.conf" "${HOME}/.config/kitty/kitty.conf"
  ln -s "${PWD}/ssh_config" "${HOME}/.ssh/config"
}

install_completitions() {
  kind completion zsh >~/.oh-my-zsh/custom/completions/_kind
  eksctl completion zsh >~/.oh-my-zsh/custom/completions/_eksctl
}

install_navi() {
  if [ -e "${HOME}/Library/Application Support/navi/cheats/adn.cheat" ] || [ -L "${HOME}/Library/Application Support/navi/cheats/adn.cheat" ]; then
    rm "${HOME}/Library/Application Support/navi/cheats/adn.cheat"
  fi
  ln -s "${PWD}/adn-navi.cheat" "${HOME}/Library/Application Support/navi/cheats/adn.cheat"
}

install_kitty() {
  if [ -e "${HOME}/.config/kitty/kitty.conf" ] || [ -L "${HOME}/.config/kitty/kitty.conf" ]; then
    rm "${HOME}/.config/kitty/kitty.conf"
  fi
  ln -s "${PWD}/kitty.conf" "${HOME}/.config/kitty/kitty.conf"
}

install_psqlrc() {
  echo "Configuring psqlrc"
  if [ -e "${HOME}/.psqlrc" ] || [ -L "${HOME}/.psqlrc" ]; then
    rm "${HOME}/.psqlrc"
  fi
  ln -s "${PWD}/psqlrc" "${HOME}/.psqlrc"
}

install_tmux() {
  echo "Configuring tmux"
  if [ -e "${HOME}/.tmux.conf" ] || [ -L "${HOME}/.tmux.conf" ]; then
    rm "${HOME}/.tmux.conf"
  fi
  ln -s "${PWD}/tmux.conf" "${HOME}/.tmux.conf"

  if [ -d "${HOME}/.tmux/plugins/tpm" ]; then
    rm -rf "${HOME}/.tmux/plugins/tpm"
  fi
  mkdir -p "${HOME}/.tmux/plugins/"
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
  "${HOME}/.tmux/plugins/tpm/bin/install_plugins"
}

install_git() {
  echo "Configuring git"
  if [ -e "${HOME}/.gitconfig" ] || [ -L "${HOME}/.gitconfig" ]; then
    rm "${HOME}/.gitconfig"
  fi
  ln -s "${PWD}/gitconfig" "${HOME}/.gitconfig"
  if [ -e "${HOME}/.gitignore_global" ] || [ -L "${HOME}/.gitignore_global" ]; then
    rm "${HOME}/.gitignore_global"
  fi
  ln -s "${PWD}/gitignore_global" "${HOME}/.gitignore_global"
}

install_brewfile() {
  echo "Installing brewfile"
  brew bundle install --file="${PWD}/Brewfile" || exit 1
  brew link --force libpq

}

install_zsh() {
  echo "Configuring zsh"
  if [ -e "${HOME}/.zshrc" ] || [ -L "${HOME}/.zshrc" ]; then
    rm "${HOME}/.zshrc"
  fi
  ln -s "${PWD}/zsh/zshrc" "${HOME}/.zshrc"
  if [ ! -d "${HOME}/.oh-my-zsh/" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
  if [ -e "${HOME}/.oh-my-zsh/themes/adn.zsh-theme" ] || [ -L "${HOME}/.oh-my-zsh/themes/adn.zsh-theme" ]; then
    rm "${HOME}/.oh-my-zsh/themes/adn.zsh-theme"
  fi
  ln -s "${PWD}/zsh/adn.zsh-theme" "${HOME}/.oh-my-zsh/themes/adn.zsh-theme"

  if [ -d "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-completions" ]; then
    rm -rf "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-completions"
  fi
  git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-completions"

  if [ -d "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions" ]; then
    rm -rf "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions"
  fi
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions"

  if [ -d "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-vi-mode" ]; then
    rm -rf "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-vi-mode"
  fi
  git clone https://github.com/jeffreytse/zsh-vi-mode \
    "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-vi-mode"

  if [ -d "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting" ]; then
    rm -rf "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting"
  fi
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting"
}

install_vim() {
  echo "Configuring neovim"
  cargo binstall bob-nvim --secure -y
  bob install nightly
  bob use nightly

  if [ -e "${HOME}/.config/nvim" ] || [ -L "${HOME}/.config/nvim" ]; then
    rm -rf "${HOME}/.config/nvim/init.vim"
  fi
  ln -s "${PWD}/nvim" "${HOME}/.config/nvim"

  if [ -e "${HOME}/.ctags" ] || [ -L "${HOME}/.ctags" ]; then
    rm "${HOME}/.ctags"
  fi
  ln -s "${PWD}/ctags" "${HOME}/.ctags"
}

install_node() {
  echo "Installing nodejs"
  if [ -e "${HOME}/.default-npm-package" ] || [ -L "${HOME}/.default-npm-package" ]; then
    rm "${HOME}/.default-npm-package"
  fi
  ln -s "${PWD}/default-npm-package" "${HOME}/.default-npm-package"
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest
  asdf global nodejs latest
}

install_golang() {
  echo "Installing golang"
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
  asdf install golang latest
  asdf global golang latest
}

install_postgres() {
  echo "Installing postgres"
  asdf plugin-add postgres
  asdf install postgres 14.4
  asdf global postgres 14.4
}

install_rust() {
  echo "Installing rust"
  asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
  asdf install rust latest
  asdf global rust latest
  cargo install cargo-update
  curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
  cargo binstall cargo-nextest --secure
}

install_timescale() {
  cargo install cargo-pgx --git https://github.com/timescale/pgx --branch promscale-staging
  cargo pgx init --pg14=/opt/homebrew/bin/pg_config
}

main || exit 1
