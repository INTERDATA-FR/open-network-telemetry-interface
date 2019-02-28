ARG BASE_IMAGE
FROM ${BASE_IMAGE}

MAINTAINER Thibault CHEVALLERAUD <tchevalleraud@interdata.fr>
MAINTAINER Julien LORENT <jlorent@interdata.fr>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install git wget make curl && \
    apt-get clean

ARG TELEGRAF_VERSION
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_amd64.deb
RUN dpkg -i telegraf_${TELEGRAF_VERSION}_amd64.deb

RUN apt-get -y install iputils-ping

WORKDIR /

ADD ./config/telegraf.init.sh /usr/bin/telegraf.init.sh
RUN chmod 755 /usr/bin/telegraf.init.sh

ENTRYPOINT [ "/usr/bin/telegraf.init.sh" ]