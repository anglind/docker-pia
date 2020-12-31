FROM alpine:latest

LABEL maintainer="Donal Anglin <donal.anglin@gmail.com>"

RUN apk add --no-cache openvpn
COPY pia /pia
WORKDIR /pia
COPY openvpn.sh /usr/local/bin/openvpn.sh

ENTRYPOINT ["openvpn.sh"]