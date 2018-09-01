# ADN's configuration files

vim, tmux, zsh, sublime, psql, ctags

## Gnome Terminal Profiles

backup

```
$ dconf dump /org/gnome/terminal/ > gnome_terminal_settings_backup.txt
```

restore

```
$ dconf reset -f /org/gnome/terminal/
$ dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt
```

## Fonts

This are firecode with ligatures

```
 brew tap caskroom/font 
 brew cask install font-firacode-nerd-font
```
