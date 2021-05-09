FROM cabanaonline/ubuntu-dev:1.0

LABEL base.image="cabanaonline/alpine"
LABEL description="A Python container."
LABEL maintainer="Alejandro Madrigal Leiva"
LABEL maintainer.email="me@alemadlei.tech"

ARG USER=cabana
ENV HOME /home/$USER

USER root

# Install python.
RUN set -xe; \
    \
    wget https://www.python.org/ftp/python/3.3.0/Python-3.3.0.tgz && \
    tar xzvf Python-3.3.0.tgz && \
    cd Python-3.3.0 && \
    ./configure && \
    make && \
    make install;

RUN set -xe; \
    \
    apt-get update && \
    apt-get install -y python3-pip

# Removes development tools.
COPY packages.sh /opt/scripts/packages.sh
RUN set -xe; \
    \
    cd /opt/scripts && ./uninstall.sh && \
    apt-get clean && \
    apt-get autoclean;

# Changes to work user.
USER $USER

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]
