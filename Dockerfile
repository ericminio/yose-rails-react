FROM ruby:3-alpine

RUN apk update \
    && apk add bash

RUN echo "PS1='\n\[\e[32m\]\u \[\e[33m\]in \w\[\e[0m\] \n> '" >> ~/.bashrc
ENTRYPOINT [ "bash" ]

WORKDIR /usr/local/src    