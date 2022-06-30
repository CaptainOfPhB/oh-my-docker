FROM archlinux:base-devel

WORKDIR /tmp
ENV SHELL /bin/bash
# https://archlinux.org/mirrorlist/
ADD pacman_mirrorlist /etc/pacman.d/mirrorlist

# Clean pacman packages cache & Upgrade everthing
# Make sure the following command executed at first
# More pacman usages please check https://devhints.io/pacman
RUN yes | pacman -Syu

# Install curl and wget
RUN yes | pacman -S wget curl

# Install git
RUN yes | pacman -S git

# Install vi, vim and neovim
RUN yes | pacman -S vi vim neovim

# Install zsh
RUN yes | pacman -S zsh