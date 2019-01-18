package com.zhiyesoft.cloud.modules.system.mapper;

import org.apache.ibatis.annotations.Param;

import com.zhiyesoft.cloud.basic.core.mapper.BaseMapper;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.modules.system.vo.UserVo;

public interface UserMapper extends BaseMapper<User> {
	/**
	 * 根据用户名去查询带有角色与权限的对象。
	 * 
	 * @param username
	 * @return
	 */
	UserVo selectByUsername(@Param(value = "username") String username);
	/**
	 * 根据用户名去查询带有角色与权限的对象。
	 * 
	 * @param username
	 * @return
	 */
	UserVo findByName(@Param(value = "username") String username);
}