FROM konstruktoid/ubuntu:trusty

ENV USER irssi
ENV HOME /home/$USER
ENV LANG C.UTF-8
ENV SSL /etc/ssl/certs

RUN mkdir -p $SSL && \
    echo 'deb http://se.archive.ubuntu.com/ubuntu trusty universe' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install wget irssi irssi-plugin-otr ca-certificates --no-install-recommends && \
    apt-get -y clean && \
    wget --no-check-certificate https://www.instantssl.com/ssl-certificate-support/cert_installation/UTN-USERFirst-Hardware.crt -O $SSL\UTN-USERFirst-Hardware.pem && \
    rm -rf /var/lib/apt/lists/* \
      /usr/share/doc /usr/share/doc-base \
      /usr/share/man /usr/share/locale /usr/share/zoneinfo

RUN useradd --create-home --home-dir $HOME $USER && \
    mkdir -p $HOME/.irssi && \
    chown -R $USER:$USER $HOME

WORKDIR $HOME
VOLUME $HOME/.irssi

USER $USER

ENTRYPOINT ["/usr/bin/irssi"]
CMD []
