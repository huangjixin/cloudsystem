package com.zhiyesoft.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class MicroCloudAdminTxManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroCloudAdminTxManagerApplication.class, args);
	}

}

