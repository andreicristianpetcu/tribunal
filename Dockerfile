############################################################
# Dockerfile to build project tribunal (onoratainstanta.ro)
# Based on phusion/baseimage
############################################################
FROM phusion/passenger-full:0.9.12
MAINTAINER Andrei Petcu <andrei@ceata.org>

RUN apt-get update
RUN mkdir -p /data/db/
RUN apt-get install mongodb -y

RUN rm -f /etc/service/nginx/down

ADD docker_files/onoratainstanta.conf /etc/nginx/sites-enabled/onoratainstanta.conf
WORKDIR /home/app/
RUN git clone https://github.com/andreicristianpetcu/tribunal.git
WORKDIR /home/app/tribunal
RUN bundle install
RUN gem install rails

RUN echo "127.0.0.1       onoratainstanta.ro"| tee -a /etc/hosts
RUN apt-get install elinks nmap lsof -y

EXPOSE 80
EXPOSE 27017
ENTRYPOINT ["/sbin/my_init"]
CMD ["--enable-insecure-key"]
