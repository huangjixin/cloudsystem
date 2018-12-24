package com.zhiyesoft.cloud.modules.mem.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.codingapi.tx.annotation.TxTransaction;
import com.zhiyesoft.cloud.ISystemFeignClient;
import com.zhiyesoft.cloud.basic.core.mapper.BaseMapper;
import com.zhiyesoft.cloud.basic.core.service.impl.BaseServiceImpl;
import com.zhiyesoft.cloud.basic.core.vo.Response;
import com.zhiyesoft.cloud.modules.mem.domain.Member;
import com.zhiyesoft.cloud.modules.mem.mapper.MemberMapper;
import com.zhiyesoft.cloud.modules.mem.service.IMemberService;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.utils.UUIDUtil;

/**
 * @author 黄记新
 *
 */
//
@Transactional(rollbackFor = Exception.class)
@Service
public class MemberServiceImpl extends BaseServiceImpl<Member> implements IMemberService {

	////////////////////////////////////////////////////////
	///// 变量区域
	////////////////////////////////////////////////////////

	private static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	private static final String BASE_MESSAGE = "会员模块类MemberServiceImpl增删改查";

	@Autowired
	private MemberMapper memberMapper;

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////
	///// 方法区域
	////////////////////////////////////////////////////////

	@Override
	protected BaseMapper<Member> getBaseMapper() {
		return this.memberMapper;
	}

	@Override
	protected String getBaseMessage() {
		return BASE_MESSAGE;
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

	@Autowired
	private ISystemFeignClient systemFeignClient;

//	@TxTransaction(isStart = true)
	@Override
	public int insertSelective(Member record) {
		PasswordEncoder passEncoder = new BCryptPasswordEncoder();
		User user = new User();
		user.setId(UUIDUtil.generateID());
		user.setLoginName(UUIDUtil.generateID());
		user.setPassword(passEncoder.encode("123456"));
		Response respon = this.systemFeignClient.save(user);
//		double s = 10 / 0;

		return super.insertSelective(record);
	}

}
