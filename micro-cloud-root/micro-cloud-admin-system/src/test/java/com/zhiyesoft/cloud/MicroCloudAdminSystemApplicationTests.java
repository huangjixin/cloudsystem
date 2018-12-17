package com.zhiyesoft.cloud;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.modules.system.service.IUserService;
import com.zhiyesoft.cloud.utils.UUIDUtil;

@RunWith(SpringRunner.class)
@SpringBootTest(classes=MicroCloudAdminSystemApplication.class)// 指定spring-boot的启动类
public class MicroCloudAdminSystemApplicationTests {

	@Autowired
	private IUserService userService;
	
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
		int result = userService.testInsert(user);
//		double s = 10/0;
		assertEquals(1, result);
//		System.out.println(userService==null);
	}
}
