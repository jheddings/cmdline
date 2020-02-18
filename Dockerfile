FROM debian:buster

COPY Welcome.txt /etc/motd

CMD cat /etc/motd ; /bin/sh
