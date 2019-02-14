ARG BASE_IMAGE
FROM ${BASE_IMAGE}

MAINTAINER Thibault CHEVALLERAUD <tchevalleraud@interdata.fr>
MAINTAINER Julien LORENT <jlorent@interdata.fr>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install git wget make curl && \
    apt-get clean

ARG INFLUXDB_VERSION
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb
RUN dpkg -i influxdb_${INFLUXDB_VERSION}_amd64.deb

WORKDIR /

ADD ./config/influxdb.init.sh /usr/bin/influxdb.init.sh
ADD ./config/config.toml /opt/influxdb/config.toml
RUN chmod 755 /usr/bin/influxdb.init.sh

EXPOSE 8083
EXPOSE 8086

ENTRYPOINT ["/usr/bin/influxdb.init.sh"]