#!/bin/sh
# My install script
# TODO
# ln -s "${DIRNAME}/psqlrc" "${HOME}/.psqlrc"
# ln -s "${DIRNAME}/tmux.conf" "${HOME}/.tmux.conf"
# ln -s "${DIRNAME}/powerline" "${HOME}/.config/"
# https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
# tic -x iterm/xterm-256color-italic.terminfo
# tic -x iterm/tmux-256color.terminfo

PACKAGES="curl vim zsh neovim gcc cmake"
DIRNAME=$(dirname $(readlink -f $0))

main() {
  local install_exa=no
  local install_from_cargo=no
  for arg in $0 ; do
    case $arg in
      --exa)
        install_exa=yes
        ;;
      --install-from-cargo)
        install_from_cargo=yes
        ;;
    esac
  done
  install_packages $PACKAGES
  install_fzf
  if [ "${install_exa}" = "yes" ] ; then
    install_exa
  fi
  install_ripgrep $install_from_cargo
  install_vim
  install_zsh
  touch "${DIRNAME}/install_successful"
}

install_packages() {
  echo "Installing packages $@"
  if command -v apt >/dev/null 2>&1 ; then
    sudo apt install -y $@
  elif command -v dnf >/dev/null 2>&1 ; then
    sudo dnf install -y $@ python2-neovim python3-neovim
  elif command -v yum >/dev/null 2>&1 ; then
    sudo yum install -y $@ python2-neovim python3-neovim
  fi
}

install_zsh() {
  echo "Installing zsh: version $(zsh --version)"
  if [ ! -d ~/.oh-my-zsh/ ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
  if [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ; then
    rm ~/.zshrc
  fi
  ln -s "${DIRNAME}/zsh/zshrc" ~/.zshrc
  if [ -e ~/.oh-my-zsh/themes/adn.zsh-theme ] || [  -L ~/.oh-my-zsh/themes/adn.zsh-theme ] ; then
    rm ~/.oh-my-zsh/themes/adn.zsh-theme
  fi
  ln -s "${DIRNAME}/zsh/adn.zsh-theme" ~/.oh-my-zsh/themes/adn.zsh-theme
  if [ -z $ZSH_NAME ] ; then
    sudo chsh -s $(which zsh)
  else
    source ~/.zshrc
  fi
}

install_vim() {
  echo "${DIRNAME}"
  echo "Installing neovim"

  mkdir -p ~/.config/nvim
  if [ -e ~/.config/nvim/init.vim ] || [ -L ~/.config/nvim/init.vim ] ; then
    rm ~/.config/nvim/init.vim
  fi
  ln -s "${DIRNAME}/vimrc"  ~/.config/nvim/init.vim
  if [ -e ~/.ctags ] || [ -L ~/.ctags ] ; then
    rm ~/.ctags
  fi
  ln -s "${DIRNAME}/ctags" ~/.ctags

  if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    nvim +PluginInstall +qall
  fi
}

install_fzf() {
  echo "Installing fzf"
  if command -v fzf >/dev/null 2>&1 ; then
    return
  fi
  if ! install_packages fzf && [ ! -d ~/.fzf ] ; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
  fi
}

install_rust() {
  echo "Check Rust installation"
  if ! command -v cargo >/dev/null 2>&1 && [ ! -e ~/.cargo/bin/cargo ] ; then
    echo "Rust is not installed. Installing it via sh.rustup.rs"
    curl https://sh.rustup.rs -sSf | sh -s -- -y
  fi
}

cargo_install() {
  echo "Cargo install $@"
  install_rust
  if command -v cargo >/dev/null 2>&1 ; then
    cargo install $@
  elif [ -e ~/.cargo/bin/cargo ] ; then
    ~/.cargo/bin/cargo install $@
  fi
}

install_ripgrep() {
  echo "Installing ripgrep: from cargo? ${1}"
  if ! command -v rg >/dev/null 2>&1 ; then
    if [ "${1}" = "yes" ]  ; then
      if ! install_packages ripgrep ; then
        cargo_install ripgrep
      fi
    else
      curl -L -o /tmp/rg.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
      sudo tar -xzf /tmp/rg.tar.gz -C /opt/
      sudo ln -s /opt/ripgrep-0.10.0-x86_64-unknown-linux-musl/rg /usr/local/bin/rg
    fi
  fi
}

install_exa() {
  echo "Installing exa"
  cargo_install exa
}

main $@ || exit 1
