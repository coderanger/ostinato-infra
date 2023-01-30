FROM debian:11
LABEL org.opencontainers.image.source=https://github.com/coderanger/ostinato-infra

RUN apt-get update -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends avahi-daemon \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

RUN chmod 777 /etc/avahi/avahi-daemon.conf \
 && mkdir -p /var/run/avahi-daemon \
 && chown avahi:avahi /var/run/avahi-daemon \
 && chmod 777 /var/run/avahi-daemon

USER 65534
ENTRYPOINT ["/usr/sbin/avahi-daemon", "--no-drop-root"]
