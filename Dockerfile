FROM docker.elastic.co/logstash/logstash:5.6.2
RUN bin/logstash-plugin install logstash-input-gelf
COPY logstash.yml /usr/share/logstash/config/logstash.yml
