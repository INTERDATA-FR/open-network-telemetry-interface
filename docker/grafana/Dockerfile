ARG BASE_IMAGE
FROM ${BASE_IMAGE}

MAINTAINER Thibault CHEVALLERAUD <tchevalleraud@interdata.fr>
MAINTAINER Julien LORENT <jlorent@interdata.fr>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install git adduser libfontconfig wget make curl && \
    apt-get clean

ARG GRAFANA_VERSION
RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_${GRAFANA_VERSION}_amd64.deb
RUN dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb

WORKDIR /

ADD ./config/grafana.init.sh /usr/bin/grafana.init.sh
RUN chmod 755 /usr/bin/grafana.init.sh

ADD ./custom/grafana_icon.svg /usr/share/grafana/public/img/grafana_icon.svg
ADD ./custom/grafana_typelogo.svg /usr/share/grafana/public/img/grafana_typelogo.svg
#ADD ./custom/heatmap_bg_test.svg /usr/share/grafana/public/img/heatmap_bg_test.svg

EXPOSE 3000

ENTRYPOINT ["/usr/bin/grafana.init.sh"]