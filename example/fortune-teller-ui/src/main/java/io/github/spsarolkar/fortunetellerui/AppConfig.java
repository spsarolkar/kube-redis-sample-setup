package io.github.spsarolkar.fortunetellerui;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Value("${COWSAY_SERVER_NAME:localhost}")
    private String cowsayServer;

    @Value("${COWSAY_SERVER_PORT:8000}")
    private String cowsayServerPort;

    @Value("${REDIS_MASTER_NAME:localhost}")
    private String redisMasterSentinelName;

    @Value("${REDIS_REPLICA_NAME:localhost}")
    private String redisReplicaSentinelName;

    @Value("${REPLICA_SENTINEL_PORT:26379}")
    private int redisReplicaSentinelPort;

    @Value("${MASTER_SENTINEL_PORT:26379}")
    private int redisMasterSentinelPort;

    @Value("${REDIS_SENTINEL_MASTER_GROUP:mymaster}")
    private String redisSentinelMasterGroup;

    public String getCowsayServer() {
        return cowsayServer;
    }

    public void setCowsayServer(String cowsayServer) {
        this.cowsayServer = cowsayServer;
    }

    public String getCowsayServerPort() {
        return cowsayServerPort;
    }

    public void setCowsayServerPort(String cowsayServerPort) {
        this.cowsayServerPort = cowsayServerPort;
    }

    public String getRedisReplicaSentinelName() {
        return redisReplicaSentinelName;
    }

    public void setRedisReplicaSentinelName(String redisReplicaSentinelName) {
        this.redisReplicaSentinelName = redisReplicaSentinelName;
    }

    public String getRedisSentinelMasterGroup() {
        return redisSentinelMasterGroup;
    }

    public void setRedisSentinelMasterGroup(String redisSentinelMasterGroup) {
        this.redisSentinelMasterGroup = redisSentinelMasterGroup;
    }

    public int getRedisReplicaSentinelPort() {
        return redisReplicaSentinelPort;
    }

    public void setRedisReplicaSentinelPort(int redisReplicaSentinelPort) {
        this.redisReplicaSentinelPort = redisReplicaSentinelPort;
    }

    public int getRedisMasterSentinelPort() {
        return redisMasterSentinelPort;
    }

    public void setRedisMasterSentinelPort(int redisMasterSentinelPort) {
        this.redisMasterSentinelPort = redisMasterSentinelPort;
    }

    public String getRedisMasterSentinelName() {
        return redisMasterSentinelName;
    }

    public void setRedisMasterSentinelName(String redisMasterSentinelName) {
        this.redisMasterSentinelName = redisMasterSentinelName;
    }
}
