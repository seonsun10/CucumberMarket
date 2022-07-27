package com.cu.cum.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.model.service.SecurityService;

public class MyProvider implements AuthenticationProvider {

	@Autowired
	private SecurityService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//DB데이터에서 인증하는 내용을 구성
		String username = authentication.getName();
		String password = (String)authentication.getCredentials();
		Member loginMember = (Member)service.loadUserByUsername(username);
		if(loginMember == null || !encoder.matches(password, loginMember.getPassword()))
			throw new BadCredentialsException("인증 실패"); //login창에서 출력
		return new UsernamePasswordAuthenticationToken(loginMember, 
				loginMember.getPassword(), loginMember.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
