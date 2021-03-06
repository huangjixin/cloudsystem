/**
 * 
 */
package com.zhiyesoft.cloud.config;

import java.util.Base64;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.jwt.Jwt;
import org.springframework.security.jwt.JwtHelper;

import com.zhiyesoft.cloud.modules.system.service.impl.UserDetailService;


/**
 * @author lenovo
 *
 */
@Configuration
//@EnableGlobalMethodSecurity(prePostEnabled = true)
//@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
    UserDetailService userServiceDetail;
	
    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
                .exceptionHandling()
                .authenticationEntryPoint((request, response, authException) -> response.sendError(HttpServletResponse.SC_UNAUTHORIZED))
            .and()
                .authorizeRequests()
                .antMatchers("/**").authenticated()
            .and()
                .httpBasic();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userServiceDetail)
                .passwordEncoder(passwordEncoder());
    }

	@Bean
	public PasswordEncoder passwordEncoder() {
		// return PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return new BCryptPasswordEncoder();
	}


	public static void main(String[] args) {
//		String content = "security-service:123456";
//		String encodeContent = Base64.getEncoder().encodeToString(content.getBytes());
//		System.out.println(encodeContent);
//		byte[] bs = Base64.getDecoder().decode(encodeContent);
//		String res = new String(bs);
//		System.out.println(res);
//    	Jwt jwt = JwtHelper.decode("eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjMxODQ2OTEzNDcsInVzZXJfbmFtZSI6IjEiLCJqdGkiOiJlYjQwNGY2YS1hMDViLTRhNjYtYTgzMS04OTFlNmQ0M2FlNjUiLCJjbGllbnRfaWQiOiJzZWN1cml0eS1zZXJ2aWNlIiwic2NvcGUiOlsic2VydmljZSJdfQ.fGY9jPftqFbkhcv3Z66J77bNH1KIjO8C4X6ZMpyWp_8FWEBoLqz72uRChBbqsFVZIZe8LvppBGj7To6vafsEE-l6A_NM616zeGGUDhDPmBV0ymJIrWsNOGLT2WgFj5xrOYZvxsXuXjTcg_OiOKw7EcRFnbSZjlViHRZ9NBvxmHd1-I6m_Krms40JobwK5eyXZgSTm863Zc2GZXyFAIhxXHkG7erRPnHHZlueekSeNYd2w8QgNE_E59qEandYQ-SUW3Xs-zrWCImvaUgbh1It9Rgjpo1CWgJ5pVANQQt1uMiKlacbJ_-omS48RLUchmMsUb4jwtnClwYmM56b-KTiXw");
//    	System.out.println(jwt.getClaims());
		
//		String passEncode = new BCryptPasswordEncoder().encode("123456");
//		System.out.println(passEncode);
		
		Jwt jwt = JwtHelper.decode("eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjMxOTIwMTY2MjIsInVzZXJfbmFtZSI6Imh1YW5nIiwiYXV0aG9yaXRpZXMiOlsiKiJdLCJqdGkiOiIwMDIwZjcxOS1hYzIwLTRkMTAtYjk2Mi0xYWRiMmMzODY4ZGQiLCJjbGllbnRfaWQiOiJzZWN1cml0eS1zZXJ2aWNlIiwic2NvcGUiOlsic2VydmljZSJdfQ.XC4HagBSu7iYFm71jlDmLzgo20PoSYEXgi2CV3Am7tvBdKTZfeR5Zubpnk4lnJB4rFuEdtyOAp9M3DHbgScfCu_giADIVEVFWzr2DwqyJ68WI0bbflcUV5eV34R4DeSmfK4mxDgLoCT4Q3ayfxZQLuUuTcVRZMyfItozFsW6BsyBpNI-kTM0Go2yTcJSKyfq4NEfU7hHO55e0NAbHvO1DzIhHhugdNMC_7f0dPlqHXMCQGTp7x1KivAiJ6xznrN8QfNadXZ1myLG6MCxE3rt4J2-jpGN-6sddyk2__ajT546qtoU_Ni7QN5Hd-Co4ojoVU_Afq8Whb9_ZaExLwbtiQ");
    	System.out.println(jwt.getClaims());
		
	}
}
