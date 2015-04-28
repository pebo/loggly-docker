#!/bin/bash

if [ -z "$TOKEN" ]; then
  echo "Missing \$TOKEN"
  exit 1
fi

if [ -z "$TAG" ]; then
  echo "Missing \$TAG"
  exit 1
fi

sed -i "s/TOKEN/$TOKEN/" /etc/rsyslog.d/22-loggly.conf
sed -i "s/TAG/$TAG/" /etc/rsyslog.d/22-loggly.conf

exec /usr/sbin/rsyslogd -n

