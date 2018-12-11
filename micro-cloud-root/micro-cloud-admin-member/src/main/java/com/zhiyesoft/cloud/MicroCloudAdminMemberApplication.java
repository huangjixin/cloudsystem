package com.zhiyesoft.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

import springfox.documentation.swagger2.annotations.EnableSwagger2;
import tk.mybatis.spring.annotation.MapperScan;

@EnableFeignClients
@SpringBootApplication
@EnableEurekaClient
@EnableSwagger2
@MapperScan("com.zhiyesoft.cloud.modules.mem.mapper")
public class MicroCloudAdminMemberApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroCloudAdminMemberApplication.class, args);
	}
}
