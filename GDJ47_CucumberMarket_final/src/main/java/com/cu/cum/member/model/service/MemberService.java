package com.cu.cum.member.model.service;

import java.util.List;

import com.cu.cum.member.model.vo.Member;

public interface MemberService {

	Member insertAdmin(Member m);

//	String checkEmail(String email);

	Member join(Member member);
	
	Member searchMember(String userId);
	
	//비밀번호 변경
	Member updatePassword(Member m);
}
