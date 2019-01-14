package com.zhiyesoft.cloud.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class WebConfig extends WebMvcConfigurationSupport {
 
    @Override
    public void addCorsMappings(CorsRegistry registry) {
    	// 允许跨域访问。
    	registry.addMapping("/**")
        .allowedOrigins("*")
        .allowedMethods("GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "OPTIONS", "TRACE")
        .allowCredentials(true);
    }
}
