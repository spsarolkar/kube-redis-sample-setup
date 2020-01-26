package io.github.spsarolkar.fortunetellerui;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import java.net.InetAddress;
import java.net.UnknownHostException;

@Configuration
public class CommonBeanFactory {

    @Bean
    @Qualifier("fortuneRestService")
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }

    @Bean
    public InetAddress getInetConfig() throws UnknownHostException {
        InetAddress inetAddress = InetAddress. getLocalHost();
        return inetAddress;
    }
}
