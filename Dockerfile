FROM tsl0922/ttyd:latest

ARG USER=sailor
ARG UID=1000
ARG GID=1000
RUN apt update \
    && apt install -y tmux openssh-client vim curl htop git  \
    && rm -rf /var/lib/apt/lists/*
RUN groupadd -g ${GID} sailors && useradd -m ${USER} --gid=${GID} --uid=${UID}  -s /bin/bash
EXPOSE 7681
WORKDIR /home/${USER}
COPY ./entrypoint.sh / 
ENTRYPOINT /entrypoint.sh
