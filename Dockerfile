FROM flyinprogrammer/ujava
MAINTAINER Alan Schegrer <flyinprogrammer@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
    . /etc/lsb-release && \
    . /etc/os-release && \
    echo "deb http://repos.mesosphere.com/${ID} ${DISTRIB_CODENAME} main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-get -y update
