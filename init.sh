#!/bin/bash

function print_green {
  echo "$(tput setaf 2)$1$(tput sgr0)"
}

packages_cli=(
'git'
'stow'
'neovim'
'fzf'
'bat'
'eza'
'zoxide'
'fish'
'trash-cli'
'ttf-cascaida-mono-nerd'
'starship'
'fastfetch'
'git'
)

# print_green "Updating installed packages..."
#update base packages
# pacman -Syu

print_green "Installing cli packages..."
# echo "$(tput setaf 1)Installing cli packages...$(tput sgr0 0)"
echo ${packages_cli[@]}
# echo $packages_cli

#install cli related packages
# pacman -S $(cat packages.txt) --noconfirm

# pacman -S git
# pacman -S stow
# pacman -S neovim
# pacman -S fzf
# pacman -S bat
# pacman -S eza
# pacman -S zoxide
# pacman -S fish
# pacman -S trash-cli
# pacman -S ttf-cascaida-mono-nerd
# pacman -S starship
# pacman -S fastfetch
# pacman -S git-delta
#
# update mirror list via reflector :

# reflector --latest 5 --country France,Germany --sort rate --save /etc/pacman.d/mirrorlist

# git
# stow
# neovim
# fzf
# curl
# bat
# eza
# zoxide
# fish
# trash cli : pacman -S trash-cli
# delta : pacman -S git-delta
# CaskaydiaMono Nerd Font : pacman -S ttf-cascaida-mono-nerd
# starship
# fastfetch

## Tmux setup
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## TODO make branch for laptop that installs kanata and configures it

## Download bat theme an reinit bat cache

# mkdir -p "$(bat --config-dir)/themes"
# curl -Lo https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/sublime/tokyonight_night.tmTheme "$(bat --config-dir)/themes/tokyonight_night.tmTheme"
# bat cache --build
