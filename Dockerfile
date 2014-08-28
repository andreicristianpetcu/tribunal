############################################################
# Dockerfile to build Cegeka batchers slave containers
# Based on phusion/baseimage
############################################################
FROM phusion/baseimage:0.9.10
MAINTAINER Andrei Petcu <andrei@ceaga.org>

RUN apt-get update
RUN apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev git make openssl ca-certificates -y

RUN apt-get install mongodb nginx -y

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN ~/.rbenv/bin/rbenv install 2.1.2
RUN ~/.rbenv/bin/rbenv global 2.1.2

EXPOSE 8080
EXPOSE 3000
ENTRYPOINT ["/sbin/my_init"]
CMD ["--enable-insecure-key"]
