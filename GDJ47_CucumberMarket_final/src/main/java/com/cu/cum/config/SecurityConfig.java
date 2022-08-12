package com.cu.cum.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


//페이지 인증 해제
@Configuration
@EnableWebSecurity
public class SecurityConfig {

	//시큐리티 설정 클래스
	@Bean
	public AuthenticationProvider authenticationProvider() {
		return new MyProvider();
	}
	
	@Bean
	public BCryptPasswordEncoder bcryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain authenticatePath(HttpSecurity http) throws Exception{
		return http.csrf().disable()
				.formLogin()
					.loginPage("/loginpage")
					.loginProcessingUrl("/loginprocess")
					.successForwardUrl("/loginsuccess")
					.usernameParameter("userId")
					.passwordParameter("password")
					.and() //http부터 또 설정 가능
				.authorizeRequests() //인증 권한
					.antMatchers("/member/*").hasAnyRole("USER","ADMIN")
					.antMatchers("/admin").hasRole("ADMIN")
					// /admin 요청에 대해서는 ROLE_ADMIN 역할을 가지고 있어야 함
//	                .antMatchers("/admin").hasRole("ADMIN")
	                // 나머지 요청에 대해서는 로그인을 요구하지 않음
					.antMatchers("/loginpage","/login","/resources/**","/joinForm","/join","/mailCheck","/idCheck","/member/selectNewChatCnt.do",
							"/member/selectNewNoticeCnt.do").permitAll()
					.anyRequest().authenticated()
					                //.anyRequest().permitAll()
					.and()
				.exceptionHandling().accessDeniedPage("/denie")
					.and()
				.logout()
					.logoutUrl("/logout")
					.logoutSuccessUrl("/successLogout.do")
					.and()
				
				.authenticationProvider(authenticationProvider())//인증 대상 빈을 받아서 설정
				.build();
	}
	
}
