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
    apt-get update && \
    apt-get install -y python python3-pip && \
    apt-get clean && \
    apt-get autoclean;

# Changes to work user.
USER $USER

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]
