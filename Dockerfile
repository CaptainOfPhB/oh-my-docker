FROM archlinux:base-devel

ARG HOST_PROXY_PORT

# https://archlinux.org/mirrorlist/
ADD pacman_mirrorlist /etc/pacman.d/mirrorlist

RUN export http_proxy=http://host.docker.internal:$HOST_PROXY_PORT
RUN export https_proxy=http://host.docker.internal:$HOST_PROXY_PORT

# https://devhints.io/pacman
RUN yes | pacman -Syu

# Install curl and wget
RUN yes | pacman -S wget curl

# Install git
RUN yes | pacman -S git
ADD .gitconfig /root/.gitconfig

# Install vi, vim and neovim
RUN yes | pacman -S vi vim neovim

# Install SpaceVim
RUN curl -sLf https://spacevim.org/install.sh | bash
ADD SpaceVim.toml /root/.SpaceVim.d/init.toml

# Install zsh
RUN yes | pacman -S zsh
RUN git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Install shadowsocks and proxychains-ng
RUN yes | pacman -S shadowsocks proxychains-ng

# Install node npm pnpm yarn nvm n nrm
RUN yes | pacman -S nodejs npm
RUN npm install --global pnpm yarn n nvm nrm
ADD .npmrc /root/.npmrc

ENTRYPOINT [ "/bin/zsh" ]
