FROM frolvlad/alpine-oraclejdk8:slim

RUN mkdir -p /opt/jmx_prometheus_httpserver && wget 'http://central.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/0.10/jmx_prometheus_httpserver-0.10-jar-with-dependencies.jar' -O /opt/jmx_prometheus_httpserver/jmx_prometheus_httpserver.jar


ADD https://github.com/kelseyhightower/confd/releases/download/v0.14.0/confd-0.14.0-linux-amd64 /usr/local/bin/confd
COPY confd /etc/confd
RUN chmod +x /usr/local/bin/confd
ENV JMX_EXPORTER_CONFIG_FILE metrics.yml
COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
