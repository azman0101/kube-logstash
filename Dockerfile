FROM docker.elastic.co/logstash/logstash:5.6.2

COPY logstash.yml /usr/share/logstash/config/logstash.yml
