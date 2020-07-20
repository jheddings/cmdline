FROM debian:buster

# some additional packages that are handy...
RUN apt-get update && \
  apt-get install --assume-yes \
    curl wget git vim tree zsh && \
  apt-get autoremove --assume-yes && \
  apt-get clean

# customize the environment a bit...
COPY etc/Welcome.txt /etc/motd
COPY etc/zshrc /root/.zshrc
COPY etc/bashrc /root/.bashrc

WORKDIR "/root"

CMD cat /etc/motd ; /bin/zsh
