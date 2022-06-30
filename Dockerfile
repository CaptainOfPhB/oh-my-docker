FROM archlinux:base-devel

WORKDIR /tmp
ENV SHELL /bin/bash
# https://archlinux.org/mirrorlist/
ADD pacman_mirrorlist /etc/pacman.d/mirrorlist

# Clean pacman packages cache & Upgrade everthing
# Make sure the following command executed at first
# More pacman usages please check https://devhints.io/pacman
RUN pacman -Syu

# Install git
RUN yes | pacman -Sy git

# Install vi and vim
RUN yes | pacman -S vi vim

# Install zsh
RUN yes | pacman -S zsh