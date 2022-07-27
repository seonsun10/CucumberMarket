package com.cu.cum.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cu.cum.member.model.dao.MemberDao;
import com.cu.cum.member.model.vo.Member;

@Service
public class SecurityService implements UserDetailsService {

	@Autowired
	private MemberDao memberRepo;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Member m = memberRepo.findByUserId(username);
		
		if(m == null) throw new UsernameNotFoundException(username + "을 찾을 수 없습니다.");
		
		return m;
	}

	
	
	
}
