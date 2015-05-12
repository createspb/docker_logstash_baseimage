# Dockerhub: createdigitalspb/docker_logstash_baseimage

A baseimage that has logstash forwarder built in.


Generate a certificate using the following command:

$ openssl req -x509  -batch -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt -subj /CN=logstash