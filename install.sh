rm "$(pwd)/zsh/zshrc"
ln -s "$(pwd)/zsh/zshrc" "${HOME}/.zshrc"
ln -s "$(pwd)/zsh/adn.zsh-theme" "${HOME}/.oh-my-zsh/themes/adn.zsh-theme"
ln -s "$(pwd)/ctags" "${HOME}/.ctags"
ln -s "$(pwd)/psqlrc" "${HOME}/.psqlrc"
ln -s "$(pwd)/tmux.conf" "${HOME}/.tmux.conf"
mkdir -p "${HOME}/.config/nvim"
ln -s "$(pwd)/vimrc" "${HOME}/.config/nvim/init.vim"
# https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
tic -x iterm/xterm-256color-italic.terminfo
tic -x iterm/tmux-256color.terminfo
