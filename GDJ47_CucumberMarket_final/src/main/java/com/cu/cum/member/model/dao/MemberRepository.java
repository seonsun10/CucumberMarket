package com.cu.cum.member.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.member.model.vo.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
	
	Member save(Member member);
	
	Member findByUserId(String userId);
	
//    Member findByUserIdAndPassword(String userId, String password);

//	Member checkEmail(String email);


}
