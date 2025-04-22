FROM ubuntu:22.04

ENV TERM=xterm-256color

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

RUN apt-get update && \
    apt install build-essential -y && \
    apt install ca-certificates -y && \
    apt install cmake -y && \
    apt install git -y && \
    apt install lua5.4 -y && \
    apt install openssh-client -y && \
    apt install python3 -y && \
    apt install python3-pip -y && \
    apt install python3-venv -y && \
    apt install ripgrep -y && \
    apt install unzip -y && \
    apt install wget -y

WORKDIR /home/

# Python
COPY requirements.txt .
RUN pip install -r requirements.txt

# build neovim from source
RUN git clone https://github.com/neovim/neovim.git && \
    cd neovim && \
    make CMAKE_BUILD_TYPE=Release && \
    make install

# add neovim config and run initialization
RUN git clone https://github.com/michael-koller-91/kickstart.nvim.git ~/.config/nvim && \
    nvim --headless -c "MasonInstallAll" -c 'TSUpdate' -c "quitall"
    # nvim --headless -c "MasonInstallAll" -c 'TSInstallSync all' -c "quitall" # this installs everything
