FROM debian:jessie

RUN apt-get update
#RUN apt-get -y dist-upgrade

RUN apt-get install -y rsyslog-gnutls \
  curl

RUN mkdir -pv /etc/rsyslog.d/keys/ca.d && cd /etc/rsyslog.d/keys/ca.d && curl -sS -O https://logdog.loggly.com/media/loggly.com.crt && curl -sS -O https://certs.starfieldtech.com/repository/sf_bundle.crt && cat sf_bundle.crt loggly.com.crt > loggly_full.crt

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ADD 22-loggly.conf /etc/rsyslog.d/22-loggly.conf

EXPOSE 514
EXPOSE 514/udp

CMD ["/tmp/run.sh"]

