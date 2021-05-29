FROM ghcr.io/linuxserver/transmission

WORKDIR /opt/pia

RUN apk add \
  git \
  jq \
  ncurses \
  curl \
  wireguard-tools

COPY manual-connections/* ./

ENTRYPOINT bash run_setup.sh
