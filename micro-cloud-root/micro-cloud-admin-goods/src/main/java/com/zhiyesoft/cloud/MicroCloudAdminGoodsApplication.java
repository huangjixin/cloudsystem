package com.zhiyesoft.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import springfox.documentation.swagger2.annotations.EnableSwagger2;
import tk.mybatis.spring.annotation.MapperScan;

@EnableCaching
@EnableTransactionManagement
@EnableFeignClients
@SpringBootApplication
@EnableEurekaClient
@EnableSwagger2
@MapperScan("com.zhiyesoft.cloud.modules.goods.mapper")
public class MicroCloudAdminGoodsApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroCloudAdminGoodsApplication.class, args);
	}
}
