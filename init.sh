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

packages_cli=(
'bat'
'eza'
'fastfetch'
'fish'
'fzf'
'git'
'neovim'
'starship'
'stow'
'tmux'
'trash-cli'
'ttf-cascadia-mono-nerd'
'zoxide'
)


print_green "Installing cli packages..."
echo ${packages_cli[@]}
sudo pacman -S --noconfirm ${packages_cli[@]}
# if [ $retVal -ne 0 ]; then
#     error_exit "Error installing cli packages"
#     exit 1
# fi

# Tmux setup
print_green "Clone tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# if [ $retVal -ne 0 ]; then
#     error_exit "Error cloning tmux plugin manager"
#     exit 1
# fi

# TODO make branch for laptop that installs kanata and configures it

# Bat setup
bat cache --build
# if [ $retVal -ne 0 ]; then
#     error_exit "Error cloning tmux plugin manager"
#     exit 1
# fi

# Set fish as default shell
print_green "Seting fish as default shell"
sudo chsh -s /usr/bin/fish $USER

print_green "Cloning dotfiles..."
git clone --recurse-submodules git@github.com:ntw1vnl/dotfiles.git ~/dotfiles

print_green "Stowing dotfiles..."
cd ~/dotfiles
stow --dotfiles .

