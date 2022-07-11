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
  install_vim
  install_golang
  install_postgres
  install_rust
  install_timescale
}

install_kitty() {
  if [ -e ~/.config/kitty/kitty.conf ] || [ -L ~/.config/kitty/kitty.conf ] ; then
    rm ~/.config/kitty/kitty.conf
  fi
  ln -s "${PWD}/kitty.conf" ~/.config/kitty/kitty.conf
}

install_psqlrc() {
  echo "Configuring psqlrc"
  if [ -e ~/.psqlrc ] || [ -L ~/.psqlrc ] ; then
    rm ~/.psqlrc
  fi
  ln -s "${PWD}/psqlrc" ~/.psqlrc
}

install_tmux() {
  echo "Configuring tmux"
  if [ -e ~/.tmux.conf ] || [ -L ~/.tmux.conf ] ; then
    rm ~/.tmux.conf
  fi
  ln -s "${PWD}/tmux.conf" ~/.tmux.conf

  if [ -d ~/.tmux/plugins/tpm ] ; then
    rm -rf ~/.tmux/plugins/tpm
  fi
  mkdir -p ~/.tmux/plugins/
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
}

install_git() {
  echo "Configuring git"
  if [ -e ~/.gitconfig ] || [ -L ~/.gitconfig ] ; then
    rm ~/.gitconfig
  fi
  ln -s "${PWD}/gitconfig" ~/.gitconfig
  if [ -e ~/.gitignore_global ] || [ -L ~/.gitignore_global ] ; then
    rm ~/.gitignore_global
  fi
  ln -s "${PWD}/gitignore_global" ~/.gitignore_global
}

install_brewfile() {
  echo "Installing brewfile"
  brew bundle install --file=${PWD}/Brewfile || exit 1
  brew link --force libpq

}

install_zsh() {
  echo "Configuring zsh"
  if [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ; then
    rm ~/.zshrc
  fi
  ln -s "${PWD}/zsh/zshrc" ~/.zshrc
  if [ ! -d ~/.oh-my-zsh/ ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
  if [ -e ~/.oh-my-zsh/themes/adn.zsh-theme ] || [  -L ~/.oh-my-zsh/themes/adn.zsh-theme ] ; then
    rm ~/.oh-my-zsh/themes/adn.zsh-theme
  fi
  ln -s "${PWD}/zsh/adn.zsh-theme" ~/.oh-my-zsh/themes/adn.zsh-theme

  if [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions ] ; then
    rm -rf ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
  fi
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

  if [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions ] ; then
    rm -rf ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
  fi
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions

  if [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-vi-mode ] ; then
    rm -rf ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-vi-mode
  fi
  git clone https://github.com/jeffreytse/zsh-vi-mode \
    ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-vi-mode

  if [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting ] ; then
    rm -rf ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting
  fi
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting
}

install_vim() {
  echo "Configuring neovim"

  mkdir -p ~/.config/nvim
  if [ -e ~/.config/nvim/init.vim ] || [ -L ~/.config/nvim/init.vim ] ; then
    rm ~/.config/nvim/init.vim
  fi
  ln -s "${PWD}/vimrc"  ~/.config/nvim/init.vim
  if [ -e ~/.ctags ] || [ -L ~/.ctags ] ; then
    rm ~/.ctags
  fi
  ln -s "${PWD}/ctags" ~/.ctags

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim +PluginInstall +qall
}

install_node() {
  echo "Installing nodejs"
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest
  asdf global nodejs latest
  npm install -g neovim
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
}

install_timescale() {
  # This is from https://github.com/timescale/promscale_extension/pull/409/files
  /opt/homebrew/Cellar/timescaledb/2.7.1/bin/timescaledb_move.sh
  pg_stop
  pg_start
  cargo install cargo-pgx --git https://github.com/timescale/pgx --branch promscale-staging
  cargo pgx init --pg14=/opt/homebrew/bin/pg_config
}
main || exit 1
