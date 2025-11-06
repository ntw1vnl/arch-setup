#!/bin/bash

set -euo pipefail
trap 'echo "Error on line $LINENO"; exit 1' ERR

function print_green {
  echo "$(tput setaf 2)$1$(tput sgr0)"
}

function error_exit {
    echo "Error: $1" >&2
    exit 1
}

# TODO: generate an ssh key and add it to github to authenticate

packages_devel=(
  'base-devel'
  'git'
)

print_green "Installing devel packages..."
sudo pacman -S --noconfirm ${packages_devel[@]}

packages_cli=(
'bat'
'eza'
'fastfetch'
'fish'
'fzf'
'neovim'
'ripgrep'
'starship'
'stow'
'tmux'
'trash-cli'
'ttf-cascadia-mono-nerd'
'zoxide'
)

print_green "Installing cli packages..."
sudo pacman -S --noconfirm ${packages_cli[@]}

# Tmux setup
print_green "Clone tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# TODO make branch for laptop that installs kanata and configures it

# Bat setup
bat cache --build

# Set fish as default shell
print_green "Seting fish as default shell"
sudo chsh -s /usr/bin/fish $USER

print_green "Cloning dotfiles..."
git clone --recurse-submodules git@github.com:ntw1vnl/dotfiles.git ~/dotfiles

print_green "Stowing dotfiles..."
cd ~/dotfiles
stow --dotfiles .

