FROM alpine:3.21.3

RUN apk upgrade --no-cache && apk add --no-cache apcupsd openssh-client
COPY apcupsd.conf doshutdown /etc/apcupsd/

VOLUME ["/root/.ssh"]

CMD ["apcupsd", "-b"]
