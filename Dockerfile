FROM archlinux:base-devel

ARG HOST_PROXY_PORT
ENV HOST_PROXY_PORT $HOST_PROXY_PORT

ENV SHELL /bin/bash
# https://archlinux.org/mirrorlist/
ADD pacman_mirrorlist /etc/pacman.d/mirrorlist

# Create init.sh
RUN echo '#!/usr/bin/bash' >> /root/init.sh
RUN echo "export http_proxy=http://host.docker.internal:$HOST_PROXY_PORT" >> /root/init.sh
RUN echo "export https_proxy=http://host.docker.internal:$HOST_PROXY_PORT" >> /root/init.sh
RUN echo 'yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"' >> /root/init.sh

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

# Install shadowsocks and proxychains-ng
RUN yes | pacman -S shadowsocks proxychains-ng