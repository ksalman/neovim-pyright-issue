FROM ubuntu:20.04
RUN apt-get update && apt-get install --yes \
    curl \
    git \
    dirmngr \
    apt-transport-https \
    lsb-release ca-certificates \
    && rm -fr /var/lib/apt/lists/*
# Neovim 0.5
RUN curl -sLO https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage \
    && chmod a+x /nvim.appimage && /nvim.appimage --appimage-extract \
    && rm /nvim.appimage
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim
# vim-plug
RUN curl -sLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# node 12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install nodejs \
    && rm -fr /var/lib/apt/lists/*
# pyright
RUN npm install -g pyright@1.1.155
# Install plugins
RUN mkdir ~/.config/nvim
COPY init.vim /root/.config/nvim/init.vim
RUN nvim --headless +PlugInstall +qall
# test file
RUN mkdir /root/mytest && cd /root/mytest && git init && touch main.py
COPY main.py /root/mytest/main.py
