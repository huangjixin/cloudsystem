package com.zhiyesoft.cloud;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import feign.hystrix.FallbackFactory;


/**
 * @author 黄记新
 * 该方法提供了
 */
@FeignClient(name = "system-service", fallbackFactory = SystemFeignClientFallbackFactory.class)
public interface ISystemFeignClient {
	@RequestMapping(name="test",method=RequestMethod.GET)
	public String test();
	
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
		};
	}

}