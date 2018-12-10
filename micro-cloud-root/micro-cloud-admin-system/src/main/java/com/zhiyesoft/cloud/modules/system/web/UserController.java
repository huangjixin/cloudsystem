package com.zhiyesoft.cloud.modules.system.web;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyesoft.cloud.basic.core.vo.Response;
import com.zhiyesoft.cloud.basic.core.web.BaseController;
import com.zhiyesoft.cloud.modules.system.domain.User;
import com.zhiyesoft.cloud.modules.system.service.IUserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * @author 黄记新
 *
 */
@Api(tags = "系统用户后台控制器Api", description = "系统用户后台控制器api，包括提供基础的增删改查")
@Controller
@RequestMapping("user")
public class UserController extends BaseController {
	
	@Autowired
	private IUserService userService;
	
	@ApiOperation(value = "保存对象", notes = "")
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public Response save(@ModelAttribute User record) {
        Response response = null;
        
        record.setCreateTime(new Date());
        record.setUpdateTime(new Date());
        userService.insert(record);
        response = new Response();
        return response;
    }

    @ApiOperation(value = "更新对象", notes = "")
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Response update(@ModelAttribute User record) {
    	record.setUpdateTime(new Date());
        Response response = null;
        response = new Response();
        this.userService.updateByPrimaryKey(record);
        return response;
    }

    @ApiOperation(value = "查看对象", notes = "")
    @GetMapping(value = "view")
    @ResponseBody
    public Response getById(@RequestParam(name = "id", required = true) String id) {
        Response response ;
        response = new Response();
        User user =  this.userService.selectByPrimaryKey(id);
        response.setData(user);
        return response;
    }

    @ApiOperation(value = "刪除对象", notes = "")
    @GetMapping(value = "delete")
    @ResponseBody
    public Response delete(@RequestParam(name = "id", required = true) String id) {
        // 删除对象的时候，先检查子类有没有删除光对象。
        Response response = new Response();
        int result = this.userService.deleteByPrimaryKey(id);
        if(result == 1) {
        	response.setMessage("删除成功");
        }
        return response;
    }
}
