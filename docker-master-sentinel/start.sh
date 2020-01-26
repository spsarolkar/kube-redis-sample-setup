#!/bin/bash

redis-server /usr/local/etc/redis/redis.conf --cluster-announce-ip $MY_POD_IP --cluster-announce-port $MASTER_ANNOUNCE_PORT &> /var/log/redis-master.log &
redis-server /usr/local/etc/redis/sentinel.conf --sentinel announce-ip $MY_POD_IP --sentinel announce-port $SENTINEL_ANNOUNCE_PORT --sentinel monitor mymaster $MY_POD_IP $MASTER_ANNOUNCE_PORT 2 --sentinel down-after-milliseconds mymaster 30000 --sentinel parallel-syncs mymaster 1 --sentinel failover-timeout mymaster 180000 &> /var/log/redis-sentinel.log &
sleep infinity