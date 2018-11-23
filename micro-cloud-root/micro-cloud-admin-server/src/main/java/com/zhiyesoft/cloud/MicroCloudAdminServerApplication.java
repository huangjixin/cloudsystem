package com.zhiyesoft.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class MicroCloudAdminServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroCloudAdminServerApplication.class, args);
	}
}
