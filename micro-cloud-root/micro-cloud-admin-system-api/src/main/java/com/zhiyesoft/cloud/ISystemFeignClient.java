package com.zhiyesoft.cloud;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhiyesoft.cloud.basic.core.vo.Response;
import com.zhiyesoft.cloud.modules.system.domain.User;

import feign.hystrix.FallbackFactory;


/**
 * @author 黄记新
 * 该方法提供了
 */
@FeignClient(value = "system-service", fallbackFactory = SystemFeignClientFallbackFactory.class)
public interface ISystemFeignClient {
	@RequestMapping(value="/user/test",method=RequestMethod.GET)
	public String test();
	
	@RequestMapping(value="/user/save",method=RequestMethod.POST)
	public Response save(@ModelAttribute User record);
}

@Component
class SystemFeignClientFallbackFactory implements FallbackFactory<ISystemFeignClient>  {

	@Override
	public ISystemFeignClient create(Throwable cause) {
		return new ISystemFeignClient() {
			@Override
			public String test() {
				return "test方法调用出错，回滚方法被调用";
			}

			@Override
			public Response save(User record) {
				Response response = null;
				response = new Response();
				return response;
			}
		};
	}

}