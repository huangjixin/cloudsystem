package com.codingapi.ribbon.loadbalancer;

import com.codingapi.tx.config.service.TxManagerTxUrlService;
import com.codingapi.tx.netty.service.TxManagerHttpRequestService;
import com.codingapi.tx.springcloud.service.impl.TxManagerHttpRequestServiceImpl;
import com.codingapi.tx.springcloud.service.impl.TxManagerTxUrlServiceImpl;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnProperty(value = "tx.manager.url")
public class TxManagerConfiguration {


    @Bean
    @RefreshScope
    @ConfigurationProperties(prefix = "tx.manager")
    public TxManagerProperity txManagerProperity(){
        return new TxManagerProperity();
    }


    @Bean
    public TxManagerTxUrlService txManagerTxUrlService(){
        return new TxManagerTxUrlServiceImpl(txManagerProperity());
    }

    @Bean
    public TxManagerHttpRequestService txManagerHttpRequestService(){
        return new TxManagerHttpRequestServiceImpl();
    }
}
