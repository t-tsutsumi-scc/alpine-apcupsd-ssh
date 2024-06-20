FROM alpine:3.20.1

RUN apk upgrade --no-cache && apk add --no-cache apcupsd openssh-client
COPY apcupsd.conf doshutdown /etc/apcupsd/

VOLUME ["/root/.ssh"]

CMD ["apcupsd", "-b"]
