FROM konstruktoid/alpine

ENV USER irssi
ENV HOME /home/$USER
ENV LANG C.UTF-8
ENV SSL /etc/ssl/certs

RUN mkdir -p $SSL && \
    apk update && \
    apk upgrade && \
    apk --update add curl irssi && \
    adduser -D -h $HOME $USER && \
    mkdir -p $HOME/.irssi && \
    chown -R $USER:$USER $HOME && \
    curl -s -o $SSL\UTN-USERFirst-Hardware.pem https://www.instantssl.com/ssl-certificate-support/cert_installation/UTN-USERFirst-Hardware.crt && \
    apk del curl && \
    rm -rf /var/cache/apk/*

WORKDIR $HOME
VOLUME $HOME/.irssi

USER $USER

ENTRYPOINT ["/usr/bin/irssi"]
CMD []
