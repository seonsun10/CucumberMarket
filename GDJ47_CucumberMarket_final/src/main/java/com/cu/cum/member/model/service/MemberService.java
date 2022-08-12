package com.cu.cum.member.model.service;

import java.util.List;
import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Files;

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



	List<Files> selectUserFiles(String userId);

	
	//조회수up
	int viewCountUp(String writer);
	
	//조회수 가져오기
	int selectViewCount(String writer);

	//아이디 중복조회
	boolean existsByUserId(String userId);
	
	

}
