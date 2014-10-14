FROM charliek/openjdk-jre-7
MAINTAINER Shay Erlichmen "shay@samba.me"

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pwgen

ENV GRAYLOG_HOME /opt/graylog2-web-interface
ENV GRAYLOG_VER 0.92.0-SNAPSHOT-20141010154940

WORKDIR /opt/
RUN curl -L http://packages.graylog2.org/nightly-builds/graylog2-web-interface-${GRAYLOG_VER}.tgz | tar zx

# web-interface
RUN ln -sf /opt/graylog2-web-interface-${GRAYLOG_VER} ${GRAYLOG_HOME}

EXPOSE 9000

CMD  ["/opt/graylog2-web-interface/bin/graylog2-web-interface"]
