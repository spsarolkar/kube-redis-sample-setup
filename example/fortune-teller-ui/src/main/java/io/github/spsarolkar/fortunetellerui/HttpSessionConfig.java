package io.github.spsarolkar.fortunetellerui;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisSentinelConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

@Configuration
@EnableRedisHttpSession
public class HttpSessionConfig {

    @Autowired
    private AppConfig appConfig;

    @Bean
    public LettuceConnectionFactory connectionFactory() {
        RedisSentinelConfiguration config = new RedisSentinelConfiguration()
                .master(appConfig.getRedisSentinelMasterGroup())
                .sentinel(appConfig.getRedisMasterSentinelName(),appConfig.getRedisMasterSentinelPort())
                .sentinel(appConfig.getRedisReplicaSentinelName(),appConfig.getRedisReplicaSentinelPort());
        LettuceConnectionFactory connection = new LettuceConnectionFactory(config);
        return connection;
    }
}
