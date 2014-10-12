FROM charliek/openjdk-jre-7
MAINTAINER Shay Erlichmen "shay@samba.me"

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pwgen

ENV GRAYLOG_HOME /opt/graylog2-web-interface
ENV GRAYLOG_VER 0.91.0-rc.1

WORKDIR /opt/
RUN curl -L http://packages.graylog2.org/releases/graylog2-web-interface/graylog2-web-interface-${GRAYLOG_VER}.tgz | tar zx

# web-interface
RUN ln -s /opt/graylog2-web-interface-${GRAYLOG_VER} ${GRAYLOG_HOME}

EXPOSE 9000

ENTRYPOINT  ["${GRAYLOG_HOME}/bin/graylog2-web-interface", "--debug"]