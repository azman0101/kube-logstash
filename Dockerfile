FROM docker.elastic.co/logstash/logstash:5.6.2
USER 0:0
RUN cd /usr/share/logstash && logstash-plugin install logstash-input-gelf
COPY logstash.yml /usr/share/logstash/config/logstash.yml
