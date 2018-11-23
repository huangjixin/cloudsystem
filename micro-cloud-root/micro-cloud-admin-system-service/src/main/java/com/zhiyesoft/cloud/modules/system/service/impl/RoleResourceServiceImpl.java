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
import com.zhiyesoft.cloud.modules.system.domain.RoleResource;
import com.zhiyesoft.cloud.modules.system.mapper.RoleResourceMapper;
import com.zhiyesoft.cloud.modules.system.service.IRoleResourceService;

/**
 * @author 黄记新
 *
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class RoleResourceServiceImpl extends BaseServiceImpl<RoleResource> implements IRoleResourceService {

	////////////////////////////////////////////////////////
	///// 变量区域
	////////////////////////////////////////////////////////

	private static Logger logger = LoggerFactory.getLogger(RoleResourceServiceImpl.class);

	private static final String BASE_MESSAGE = "系统附件角色资源模块类RoleResourceServiceImpl增删改查";

	@Autowired
	private RoleResourceMapper RoleResourceMapper;

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	@Override
	protected BaseMapper<RoleResource> getBaseMapper() {
		return this.RoleResourceMapper;
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
