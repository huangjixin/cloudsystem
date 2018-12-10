package com.zhiyesoft.cloud.modules.system.service.impl;

import java.util.List;

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

	@Autowired
	private IUserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		/*UserCriteria userCriteria = new UserCriteria();
		userCriteria.createCriteria().andLoginNameEqualTo(username);
		userCriteria.or(userCriteria.createCriteria().andMobileEqualTo(username));
		List<User> list = this.userService.selectByExample(userCriteria);
		UserDetails userDetails = ((list!=null && list.size()>0?list.get(0):null));*/
		UserVo userVo = this.userService.selectByUsername(username);
		return userVo;
	}

}
