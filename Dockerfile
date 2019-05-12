FROM circleci/golang:1.12

WORKDIR /tmp

COPY ./caddy-build.sh /usr/local/bin/caddy-build
