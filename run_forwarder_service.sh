#!/bin/bash

if [ -f /opt/conf/config.json ]; then
    /opt/logstash-forwarder/bin/logstash-forwarder -config /opt/conf/config.json
fi
