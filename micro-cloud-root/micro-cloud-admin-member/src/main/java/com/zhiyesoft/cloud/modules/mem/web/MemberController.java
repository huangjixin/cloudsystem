package com.zhiyesoft.cloud.modules.mem.web;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingapi.tx.annotation.TxTransaction;
import com.zhiyesoft.cloud.ISystemFeignClient;
import com.zhiyesoft.cloud.basic.core.vo.Response;
import com.zhiyesoft.cloud.basic.core.web.BaseController;
import com.zhiyesoft.cloud.modules.mem.domain.Member;
import com.zhiyesoft.cloud.modules.mem.service.IMemberService;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.utils.UUIDUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * @author 黄记新
 *
 */
@Api(tags = "会员后台控制器Api", description = "会员后台控制器api，包括提供基础的增删改查")
@Controller
@RequestMapping("member")
public class MemberController extends BaseController {
	
	
	@Autowired
	private IMemberService memberService;

	@ApiOperation(value = "保存对象", notes = "")
	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	@TxTransaction(isStart = true)
	@Transactional(rollbackFor=Exception.class)
	public Response save(@ModelAttribute Member record) {
		
		Response response = null;
		record.setCreateTime(new Date());
		record.setUpdateTime(new Date());
		memberService.insertSelective(record);
		response = new Response();
		
		return response;
	}

	@ApiOperation(value = "更新对象", notes = "")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public Response update(@ModelAttribute Member record) {
		record.setUpdateTime(new Date());
		Response response = null;
		response = new Response();
		this.memberService.updateByPrimaryKey(record);
		return response;
	}

	@ApiOperation(value = "查看对象", notes = "")
	@GetMapping(value = "view")
	@ResponseBody
	public Response getById(@RequestParam(name = "id", required = true) String id) {
		Response response;
		response = new Response();
		Member Member = this.memberService.selectByPrimaryKey(id);
		response.setData(Member);
		return response;
	}

	@ApiOperation(value = "刪除对象", notes = "")
	@GetMapping(value = "delete")
	@ResponseBody
	public Response delete(@RequestParam(name = "id", required = true) String id) {
		// 删除对象的时候，先检查子类有没有删除光对象。
		Response response = new Response();
		int result = this.memberService.deleteByPrimaryKey(id);
		if (result == 1) {
			response.setMessage("删除成功");
		}
		return response;
	}
}
