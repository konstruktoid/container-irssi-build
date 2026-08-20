FROM konstruktoid/alpine:latest@sha256:3f47343c0873bce996c9bd6d336b44e41faa77b86558a90e213eb8da644199de

LABEL org.opencontainers.image.title="irssi" \
      org.opencontainers.image.description="Irssi IRC client with OTR support" \
      org.opencontainers.image.authors="Thomas Sjögren <konstruktoid@users.noreply.github.com>" \
      org.opencontainers.image.source="https://github.com/konstruktoid/container-irssi-build" \
      org.opencontainers.image.url="https://irssi.org" \
      org.opencontainers.image.base.name="docker.io/konstruktoid/alpine"

# IRSSI_USER rather than USER: the latter is a well-known variable that
# programs in the image read, and overriding it here changes their behaviour.
ENV IRSSI_USER=irssi
ENV HOME=/home/irssi
ENV LANG=C.UTF-8

RUN apk --no-cache add ca-certificates irssi irssi-otr && \
    adduser -D -h "${HOME}" "${IRSSI_USER}" && \
    mkdir -p "${HOME}/.irssi" && \
    chown -R "${IRSSI_USER}:${IRSSI_USER}" "${HOME}"

WORKDIR $HOME
VOLUME ["/home/irssi/.irssi"]

USER $IRSSI_USER

ENTRYPOINT ["/usr/bin/irssi"]
CMD []
