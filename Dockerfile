FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y wget sudo && \
    rm -rf /var/lib/apt/lists/* && \
    wget -qO /tmp/influx.deb https://dl.influxdata.com/influxdb/releases/influxdb_1.7.2_amd64.deb && \
    dpkg -i /tmp/influx.deb && \
    rm /tmp/influx.deb

ADD start /start
ADD influxdb.conf /etc/influxdb/influxdb.conf

VOLUME /var/lib/influxdb/
EXPOSE 8086 8088

ENTRYPOINT ["/start"]
