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

RUN apt-get install elinks -y
#RUN apt-get install ncdu nmon nmap lsof htop -y

WORKDIR /home/app/
RUN git clone https://github.com/andreicristianpetcu/tribunal.git
WORKDIR /home/app/tribunal
RUN bundle install

RUN touch log/production.log
RUN chmod 0666 log/production.log

ADD docker_files/mongo /build/runit/mongo
RUN mkdir -p /etc/service/mongo
RUN ln -s /build/runit/mongo /etc/service/mongo/run
RUN chown app -R .

ADD docker_files/onoratainstanta.conf /etc/nginx/sites-enabled/onoratainstanta.conf

EXPOSE 80
EXPOSE 27017
ENTRYPOINT ["/sbin/my_init"]
CMD ["--enable-insecure-key"]
