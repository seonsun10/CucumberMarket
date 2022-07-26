package com.cu.cum.member.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.member.model.vo.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
	
	Member findByUserId(String userId);

}
