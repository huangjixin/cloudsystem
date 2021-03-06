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
import com.zhiyesoft.cloud.modules.system.domain.Resource;
import com.zhiyesoft.cloud.modules.system.mapper.ResourceMapper;
import com.zhiyesoft.cloud.modules.system.service.IResourceService;

/**
 * @author 黄记新
 *
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class ResourceServiceImpl extends BaseServiceImpl<Resource> implements IResourceService {

	////////////////////////////////////////////////////////
	///// 变量区域
	////////////////////////////////////////////////////////

	private static Logger logger = LoggerFactory.getLogger(ResourceServiceImpl.class);

	private static final String BASE_MESSAGE = "系统资源模块类ResourceServiceImpl增删改查";

	@Autowired
	private ResourceMapper ResourceMapper;

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	@Override
	protected BaseMapper<Resource> getBaseMapper() {
		return this.ResourceMapper;
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
