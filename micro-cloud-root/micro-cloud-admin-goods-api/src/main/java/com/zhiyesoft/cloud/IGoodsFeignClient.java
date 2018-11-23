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
@FeignClient(name = "goods-service", fallbackFactory = GoodsFeignClientFallbackFactory.class)
public interface IGoodsFeignClient {
	@RequestMapping(name="test",method=RequestMethod.GET)
	public String test();
	
}

@Component
class GoodsFeignClientFallbackFactory implements FallbackFactory<IGoodsFeignClient>  {

	@Override
	public IGoodsFeignClient create(Throwable cause) {
		return new IGoodsFeignClient() {
			@Override
			public String test() {
				return "test方法调用出错，回滚方法被调用";
			}
		};
	}

}