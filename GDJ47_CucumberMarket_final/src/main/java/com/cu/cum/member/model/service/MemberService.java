package com.cu.cum.member.model.service;

import java.util.List;
import java.util.Optional;

import com.cu.cum.member.model.vo.Member;

public interface MemberService {

//	Member insertAdmin(Member m);

	Member join(Member member);

//	Member updateMember(Member member);

	Member getData(String userId);

	Member selectMember(String id);

	List<Member> selectMembers();
//
//	Member findOne(String memberId);
//
//	List<Member> findMembers();

	Member updateMember(Member m);
}
