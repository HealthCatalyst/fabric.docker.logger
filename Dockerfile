FROM docker.elastic.co/logstash/logstash:5.6.3

RUN rm -f /usr/share/logstash/pipeline/logstash.conf

COPY conf/* /usr/share/logstash/config/

COPY pipeline/* /usr/share/logstash/pipeline/
