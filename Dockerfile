FROM alpine:3.16.2

RUN apk upgrade --no-cache && apk add --no-cache apcupsd openssh-client
COPY apcupsd.conf doshutdown /etc/apcupsd/

VOLUME ["/root/.ssh"]

CMD ["apcupsd", "-b"]
