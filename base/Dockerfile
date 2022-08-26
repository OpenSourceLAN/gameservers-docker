ARG DISTRO="20.04"

FROM ubuntu:${DISTRO}

ARG TZ="Etc/UTC"
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
        git \
        unzip \
        p7zip-full\
        curl\
        wget\
        lib32gcc1\
        iproute2\
        vim-tiny\
        bzip2\
        jq\
        software-properties-common\
        apt-transport-https\
        lib32stdc++6\
    && apt-get clean
RUN echo "$TZ" > /etc/timezone
RUN  ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
