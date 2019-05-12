FROM circleci/golang:1.12

WORKDIR /project

COPY ./caddy-build.sh /usr/local/bin/caddy-build
