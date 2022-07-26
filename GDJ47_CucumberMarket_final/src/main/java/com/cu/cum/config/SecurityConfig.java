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
					.successForwardUrl("/successlogin") //web.xml에서 설정하는 것들 설정가능
					.and() //http부터 또 설정 가능
				.authorizeRequests() //인증 권한
					.antMatchers("/**").hasRole("USER")
					.and()
				.logout()
					.logoutUrl("/logout")
					.and()
				.authenticationProvider(authenticationProvider())//인증 대상 빈을 받아서 설정
				.build();
	}
	
}