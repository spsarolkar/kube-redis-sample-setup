FROM redis:5.0.7
EXPOSE 6379
COPY redis-replicator.conf /usr/local/etc/redis/redis-replicator.conf
COPY redis-sentinel.conf /usr/local/etc/redis/sentinel.conf
COPY start.sh /usr/bin/start.sh
CMD /usr/bin/start.sh