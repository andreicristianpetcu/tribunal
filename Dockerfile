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

RUN apt-get install elinks nmap lsof -y
#RUN apt-get install ncdu nmon htop -y

ADD docker_files/onoratainstanta.conf /etc/nginx/sites-enabled/onoratainstanta.conf
WORKDIR /home/app/
RUN git clone https://github.com/andreicristianpetcu/tribunal.git
WORKDIR /home/app/tribunal
# RUN gem install rails
RUN bundle install

RUN echo "127.0.0.1       onoratainstanta.ro"| tee -a /etc/hosts
RUN echo "127.0.0.1       www.onoratainstanta.ro"| tee -a /etc/hosts

RUN touch log/production.log
RUN chmod 0666 log/production.log

EXPOSE 80
EXPOSE 27017
ENTRYPOINT ["/sbin/my_init"]
CMD ["--enable-insecure-key"]
