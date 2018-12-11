/**
 * 
 */
package com.zhiyesoft.cloud.modules.goods.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhiyesoft.cloud.basic.core.mapper.BaseMapper;
import com.zhiyesoft.cloud.basic.core.service.impl.BaseServiceImpl;
import com.zhiyesoft.cloud.modules.goods.domain.Goods;
import com.zhiyesoft.cloud.modules.goods.mapper.GoodsMapper;
import com.zhiyesoft.cloud.modules.goods.service.IGoodsService;

/**
 * @author 黄记新
 *
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements IGoodsService {

	////////////////////////////////////////////////////////
	///// 变量区域
	////////////////////////////////////////////////////////

	private static Logger logger = LoggerFactory.getLogger(GoodsServiceImpl.class);

	private static final String BASE_MESSAGE = "商品模块类GoodsServiceImpl增删改查";

	@Autowired
	private GoodsMapper goodsMapper;

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	@Override
	protected BaseMapper<Goods> getBaseMapper() {
		return this.goodsMapper;
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
