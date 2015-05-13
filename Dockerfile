FROM ubuntu:vivid

ENV USER irssi
ENV HOME /home/$USER
ENV LANG C.UTF-8
ENV SSL /etc/ssl/certs

RUN mkdir -p $SSL && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install wget irssi irssi-plugin-otr --no-install-recommends && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    wget http://crt.gandi.net/GandiStandardSSLCA.crt -O $SSL/GandiStandardSSLCA.crt && \
    wget --no-check-certificate https://www.instantssl.com/ssl-certificate-support/cert_installation/UTN-USERFirst-Hardware.crt -O $SSL/UTN-USERFirst-Hardware.crt

RUN useradd --create-home --home-dir $HOME $USER && \
    mkdir -p $HOME/.irssi && \
    chown -R $USER:$USER $HOME

WORKDIR $HOME
VOLUME $HOME/.irssi

USER $USER

ENTRYPOINT ["/usr/bin/irssi"]
CMD []
