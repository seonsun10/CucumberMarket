package com.cu.cum.member.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cu.cum.member.model.vo.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, String> {
	
//	public Member findOne(String userId);
	
//	public List<Member> findAll();

	public List<Member> findByName(String name);
	
	public Member findByUserId(String userId);
	
//	Member saveAndFlush(Member m);

}
