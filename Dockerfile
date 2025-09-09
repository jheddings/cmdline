FROM debian:trixie

# some additional packages that are handy...
RUN apt-get update && \
  apt-get install --assume-yes \
    curl git vim tree netcat-openbsd iputils-ping && \
  apt-get autoremove --assume-yes && \
  apt-get clean

# customize the environment a bit...
COPY bashrc /root/.bashrc

WORKDIR "/root"

CMD ["/bin/bash"]
