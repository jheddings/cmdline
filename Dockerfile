FROM debian:buster

# some additional packages that are handy...
RUN apt-get update && \
  apt-get install --assume-yes \
    curl wget git vim tree zsh && \
  apt-get autoremove --assume-yes && \
  apt-get clean

# just because we can...
COPY Welcome.txt /etc/motd

# runtinme environment variables...
ENV TERM=xterm-color
ENV PS1="%m:%~%# "

WORKDIR "/root"

CMD cat /etc/motd ; /bin/zsh
