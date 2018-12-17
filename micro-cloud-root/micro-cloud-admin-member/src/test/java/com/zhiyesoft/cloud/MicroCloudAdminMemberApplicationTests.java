package com.zhiyesoft.cloud;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.zhiyesoft.cloud.modules.mem.service.IMemberService;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.utils.UUIDUtil;

@RunWith(SpringRunner.class)
@SpringBootTest(classes=MicroCloudAdminMemberApplication.class)// 指定spring-boot的启动类
public class MicroCloudAdminMemberApplicationTests {

	@Autowired
	private ISystemFeignClient systemFeignClient;
	
	@Autowired
	private IMemberService memberService;
	
	@Test
	public void contextLoads() {
	}

	@Test
	public void testInsertSelective() {
		PasswordEncoder passEncoder = new BCryptPasswordEncoder();
		User user = new User();
		user.setId(UUIDUtil.generateID());
		user.setLoginName(UUIDUtil.generateID());
		user.setPassword(passEncoder.encode("123456"));
		systemFeignClient.save(user);
//		int result = userService.testInsert(user);
		double s = 10/0;
		assertEquals(1, 1);
//		System.out.println(userService==null);
	}
}
