package com.zhiyesoft.cloud.modules.system.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.modules.system.domain.UserCriteria;
import com.zhiyesoft.cloud.modules.system.service.IUserService;
import com.zhiyesoft.cloud.modules.system.vo.UserVo;

@Service
public class UserDetailService implements UserDetailsService {

	////////////////////////////////////////////////////////
	///// 变量区域
	////////////////////////////////////////////////////////

	private static Logger logger = LoggerFactory.getLogger(UserDetailService.class);
	@Autowired
	private IUserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("Security-service申请授权token开始，传进来的username是："+username);
		/*UserCriteria userCriteria = new UserCriteria();
		userCriteria.createCriteria().andLoginNameEqualTo(username);
		userCriteria.or(userCriteria.createCriteria().andMobileEqualTo(username));
		List<User> list = this.userService.selectByExample(userCriteria);
		UserDetails userDetails = ((list!=null && list.size()>0?list.get(0):null));*/
		UserVo userVo = this.userService.selectByUsername(username);
		logger.info("this.userService.selectByUsername(username)调用的结果是："+(userVo!=null?userVo.toString():"null"));
		return userVo;
	}

}
