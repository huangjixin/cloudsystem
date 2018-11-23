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
import com.zhiyesoft.cloud.modules.system.domain.Dept;
import com.zhiyesoft.cloud.modules.system.mapper.DeptMapper;
import com.zhiyesoft.cloud.modules.system.service.IDeptService;

/**
 * @author 黄记新
 *
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class DeptServiceImpl extends BaseServiceImpl<Dept> implements IDeptService {

	////////////////////////////////////////////////////////
	///// 变量区域
	////////////////////////////////////////////////////////

	private static Logger logger = LoggerFactory.getLogger(DeptServiceImpl.class);

	private static final String BASE_MESSAGE = "系统组织模块类DeptServiceImpl增删改查";

	@Autowired
	private DeptMapper DeptMapper;

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	@Override
	protected BaseMapper<Dept> getBaseMapper() {
		return this.DeptMapper;
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
