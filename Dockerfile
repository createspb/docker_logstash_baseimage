FROM phusion/baseimage:0.9.16
MAINTAINER Create Digital <hello@createdigital.me>

ENV HOME /root
CMD ["/sbin/my_init"]

RUN apt-get update -qy && apt-get install -qy unzip wget software-properties-common \
    sudo git libxml2-dev libxslt-dev lib32z1-dev libpq-dev libjpeg8 libjpeg8-dev libffi-dev libtiff5 gettext

ADD logstash-forwarder_0.4.0_amd64.deb /tmp/logstash-forwarder_0.4.0_amd64.deb
RUN cd /tmp && dpkg -i logstash-forwarder_0.4.0_amd64.deb

ADD run_forwarder_service.sh /etc/service/logstash_forwarder/run
RUN chmod 755 /etc/service/logstash_forwarder/run


ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# LC_ALL FIX
RUN bash -c 'echo "export LC_ALL=C.UTF-8" >> ~/.bashrc'


ENV LANGUAGE C.UTF-8
ENV PYTHONENCODING utf8

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*