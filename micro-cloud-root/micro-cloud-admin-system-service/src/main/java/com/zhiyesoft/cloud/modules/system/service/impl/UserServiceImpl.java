/**
 * 
 */
package com.zhiyesoft.cloud.modules.system.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhiyesoft.cloud.basic.core.mapper.BaseMapper;
import com.zhiyesoft.cloud.basic.core.service.impl.BaseServiceImpl;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.modules.system.mapper.UserMapper;
import com.zhiyesoft.cloud.modules.system.service.IUserService;

/**
 * @author 黄记新
 *
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {

	////////////////////////////////////////////////////////
	///// 变量区域
	////////////////////////////////////////////////////////

	private static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	private static final String BASE_MESSAGE = "系统用户模块类UserServiceImpl增删改查";

	@Autowired
	private UserMapper userMapper;

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	@Override
	protected BaseMapper<User> getBaseMapper() {
		return this.userMapper;
	}

	@Override
	protected String getBaseMessage() {
		return BASE_MESSAGE;
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

}
