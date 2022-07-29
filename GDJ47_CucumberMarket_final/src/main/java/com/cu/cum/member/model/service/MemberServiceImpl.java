package com.cu.cum.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cu.cum.member.model.dao.MemberRepository;
import com.cu.cum.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository dao;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Override
	public Member insertAdmin(Member m) {
		// TODO Auto-generated method stub
		return dao.save(m);
	}
//	@Override
//	public String checkEmail(String email) {
//		Member member = dao.checkEmail(email);
//		if(member == null) {//사용 가능			
//			return "non_exist";
//		}else //사용 불가
//			return "exist";
//	}
	
	//회원가입 실행
	public Member join(Member member) {
		//패스워드 암호화
		member.setPassword(pwEncoder.encode(member.getPassword()));
	
		return dao.save(member);
	}
	//회원찾기
	@Override
	public Member searchMember(String userId) {
		
		return dao.findByUserId(userId);
	}
	
	//비밀번호 변경
	@Override
	public Member updatePassword(Member m) {
		
		return dao.save(m);
	}
	
	//회원정보 수정
	@Override
	public Member updateMember(Member m) {
		// TODO Auto-generated method stub
		return dao.save(m);
	}
}
