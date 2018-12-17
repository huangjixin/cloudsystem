package com.zhiyesoft.cloud.modules.system.service;

import com.zhiyesoft.cloud.basic.core.service.IBaseService;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.modules.system.vo.UserVo;

/**
 * @author 黄记新
 *
 */
public interface IUserService extends IBaseService<User> {
	/**
	 * 根据用户名去查询带有角色与权限的对象。
	 * 
	 * @param username
	 * @return
	 */
	UserVo selectByUsername(String username);
	
	int testInsert(User user);
}
