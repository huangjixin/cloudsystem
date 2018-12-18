/**
 * 
 */
package com.zhiyesoft.cloud.modules.system.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codingapi.tx.annotation.TxTransaction;
import com.zhiyesoft.cloud.basic.core.mapper.BaseMapper;
import com.zhiyesoft.cloud.basic.core.service.impl.BaseServiceImpl;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.modules.system.mapper.UserMapper;
import com.zhiyesoft.cloud.modules.system.service.IUserService;
import com.zhiyesoft.cloud.modules.system.vo.UserVo;

/**
 * @author 黄记新
 *
 */
@TxTransaction
@Transactional(rollbackFor = Exception.class)
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService
//,ITxTransaction
{

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

	@Override
	public UserVo selectByUsername(String username) {
		UserVo userVo = null;
		if(getLogger().isDebugEnabled()) {
			getLogger().debug(getBaseMessage()+"selectByUsername查询对象开始，传入的参数是："+username);
		}
		userVo = this.userMapper.selectByUsername(username);
		if(getLogger().isDebugEnabled()) {
			getLogger().debug(getBaseMessage()+"selectByUsername查询对象结束，结果是："+(userVo==null?"查询不到数据":userVo.toString()));
		}
		
		return userVo;
	}
	
	@Override
	public int insertSelective(User record) {
		return super.insertSelective(record);
	}

	@Override
	public int testInsert(User user) {
		int result = this.insertSelective(user);
		return result;
	}

}
