FROM java:8-jdk
MAINTAINER Alan Schegrer <flyinprogrammer@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
    . /etc/lsb-release && \
    . /etc/os-release && \
    echo "deb http://repos.mesosphere.com/${ID} ${DISTRIB_CODENAME} main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-get -y update

ENV CP_VERSION=2.1.0 \
    CP_SHA1=0b073e857683bb7ea7cb662b4cc0cdb7c1b48cde

RUN set -x && \
    curl -fSL "https://github.com/joyent/containerpilot/releases/download/${CP_VERSION}/containerpilot-${CP_VERSION}.tar.gz" -o cp.tar.gz && \
    tar -xzvf cp.tar.gz && \
    echo "${CP_SHA1}  ./containerpilot" | sha1sum -c - && \
    mv ./containerpilot /bin/ && \
    chmod +x /bin/containerpilot && \
    rm cp.tar.gz && \
    containerpilot -version