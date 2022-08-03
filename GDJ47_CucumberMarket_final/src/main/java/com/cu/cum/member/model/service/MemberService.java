package com.cu.cum.member.model.service;

import java.util.List;
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
	
	Member searchMember(String userId);
	
	//비밀번호 변경
	Member updatePassword(Member m);
	
	//회원정보 수정
	Member updateMember(Member m);
}
