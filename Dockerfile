FROM docker.elastic.co/logstash/logstash:5.6

COPY logstash.yml /usr/share/logstash/config/logstash.yml
