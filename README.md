loggly-docker
=============

Docker container for loggly (via rsyslog). Check out Loggly's [Docker logging documentation](https://www.loggly.com/docs/docker-syslog/) to learn more.

Usage:

```
docker run -e TOKEN=[Loggly Customer Token] -e TAG=[Tag Describing Source] sendgridlabs/loggly-docker
```

## Build

    docker build -t pebo/loggly-tls-docker .


## Run

    docker run -d -p 514/udp --name loggly-tls-docker -e TOKEN=TOKEN -e TAG=Docker pebo/loggly-tls-docker

## Log

    echo netcat:"test" | nc -u -w 1 127.0.0.1 <PORT>

