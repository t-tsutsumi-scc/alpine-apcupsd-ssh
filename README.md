# alpine-apcupsd-ssh

Docker image for [apcupsd](http://www.apcupsd.org/) with openssh-client running on [alpine](https://hub.docker.com/_/alpine).

## How to use this image

### Usage for UPS type USB

```sh
# 1. Runs alpine-apcupsd-ssh with two shutdown targets
docker run --name alpine-apcupsd-ssh -v alpine-apcupsd-ssh:/root/.ssh \
           -e SPACE_SEPARATED_SSH_DESTINATIONS="root@example1.com admin@example2.com" \
           -d ghcr.io/t-tsutsumi-scc/alpine-apcupsd-ssh:main

# 2. Generate RSA key pair for SSH login
docker exec alpine-apcupsd-ssh ssh-kengen -t rsa -f /root/.ssh/id_rsa -N '' -C root@alpine-apcupsd-ssh
docker exec alpine-apcupsd-ssh cat /root/.ssh/id_rsa.pub

# 3. Add RSA public key to .ssh/authorized_keys on SSH destination servers.
#    Note: Needs sudo to shutdown.
```
