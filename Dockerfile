############################################################
# Dockerfile to build project tribunal (onoratainstanta.ro)
# Based on phusion/baseimage
############################################################
FROM phusion/baseimage:0.9.10
MAINTAINER Andrei Petcu <andrei@ceaga.org>

RUN apt-get update
RUN apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev git make openssl ca-certificates -y

RUN apt-get install mongodb nginx nodejs -y

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

RUN rbenv install 2.1.2
RUN rbenv global 2.1.2
RUN gem install bundler
RUN rbenv rehash

RUN git clone https://github.com/andreicristianpetcu/tribunal.git
WORKDIR tribunal
RUN bundle install
RUN gem install rails
RUN rbenv rehash

RUN echo 'export PATH=/root/.rbenv/bin:/root/.rbenv/shims:$PATH' >> /etc/profile
RUN echo 'echo "$PATH" && cd /tribunal && rails s' >> /etc/my_init.d/30_start_rails.sh
RUN chmod +x /etc/my_init.d/30_start_rails.sh

EXPOSE 8080
EXPOSE 3000
EXPOSE 27017
ENTRYPOINT ["/sbin/my_init"]
CMD ["--enable-insecure-key"]
