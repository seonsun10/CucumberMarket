package com.cu.cum.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cu.cum.member.model.dao.MemberRepository;
import com.cu.cum.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
//@Transactional //final 활용
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository; //jpa 활용 - 동시성, 최적화 고려한 코드 final
	
	@Autowired
	public MemberServiceImpl(MemberRepository memberRepository) {
		// TODO Auto-generated constructor stub
		this.memberRepository = memberRepository;
	}
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
//	@Override
//	public Member insertAdmin(Member m) {
//		// TODO Auto-generated method stub
//		return memberRepository.save(m);
//	}
	
	//회원가입 실행
	@Override
	public Member join(Member member) {
		//패스워드 암호화
		member.setPassword(pwEncoder.encode(member.getPassword()));
	
		return memberRepository.save(member);
	}
	
	//회원정보 수정
	@Override
	public Member updateMember(Member member) {
		// TODO Auto-generated method stub
		return memberRepository.save(member);
	}
	
//	public void validateDuplicateMember(Member member) {
//		List<Member> findMembers = memberRepository.findByName(member.getUserId());
//		if(!findMembers.isEmpty()) {
//			throw new IllegalStateException("이미 존재하는 회원입니다.");
//		}
//	}
	
	//회원 정보 가져오기 - 미구현
//	@Override
//	public Member getData(String userId) {
//		// TODO Auto-generated method stub
//		return memberRepository.findOne(userId);
//	}
//
//	@Override
//	public Member findOne(String userId) {
//		// TODO Auto-generated method stub
//		return memberRepository.findOne(userId);
//	}
//
//	@Override
//	public List<Member> findMembers() {
//		// TODO Auto-generated method stub
//		return memberRepository.findAll();
//	}
//
//	@Override
//	public Member selectMember(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<Member> selectMembers() {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	
	
	
}
