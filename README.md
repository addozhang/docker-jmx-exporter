## What

This is a standlone process for export metrics data via jmx.

## How

Update the JMX_HOST and JMX_PORT for monitor target and HTTP_PORT which exporter will expose

```yml
version: "3"
services:
  kafka-jmx-exporter:
    image: addozhang/docker-jmx-exporter:1.0.0
    ports:
      - "8088:8080"
    environment:
      - JMX_PORT=24501
      - JMX_HOST=192.168.99.100
      - HTTP_PORT=8080
```
