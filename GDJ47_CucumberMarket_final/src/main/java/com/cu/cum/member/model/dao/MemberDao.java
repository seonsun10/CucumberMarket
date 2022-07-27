package com.cu.cum.member.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.member.model.vo.Member;

public interface MemberDao extends JpaRepository<Member, String>{
	
	Member save(Member m);
	
	Member findByUserId(String userId);

}
