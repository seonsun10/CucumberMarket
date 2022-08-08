package com.cu.cum.member.model.service;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.cu.cum.member.model.dao.FilesMapper;

import com.cu.cum.member.model.dao.MemberMapper;

import com.cu.cum.member.model.dao.MemberRepository;
import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.dao.FilesDao;
import com.cu.cum.product.model.vo.Files;

@Service
//@Transactional //final 활용
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository; //jpa 활용 - 동시성, 최적화 고려한 코드 final
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	public MemberServiceImpl(MemberRepository memberRepository) {
		// TODO Auto-generated constructor stub
		this.memberRepository = memberRepository;
	}
	
	
	@Autowired
	private FilesMapper fMapper;
	
	@Autowired
	private SqlSessionTemplate session;

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
	
	// 전체 회원 조회
    public List<Member> findMembers() {
        return memberRepository.findAll();
    }
 
    public Member findOne(String memberId) {
        return memberRepository.findByUserId(memberId);
    }
	
//	public void validateDuplicateMember(Member member) {
//		List<Member> findMembers = memberRepository.findByName(member.getUserId());
//		if(!findMembers.isEmpty()) {
//			throw new IllegalStateException("이미 존재하는 회원입니다.");
//		}
//	}
    public Member selectMember(String userId) {
		return memberRepository.findByUserId(userId);
	}
	
	public List<Member> selectMembers(){
		return memberRepository.findAll();
	}

	@Override
	public Member getData(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member updateMember(Member m) {
//		m=memberRepository.findByUserId(m.getUserId());
		return memberRepository.save(m);
	}

	//회원찾기
	@Override
	public Member searchMember(String userId) {
		
		return memberRepository.findByUserId(userId);
	}
	
	//비밀번호 변경
	@Override
	public Member updatePassword(Member m) {
		
		return memberRepository.save(m);
	}

	
	//회원이 가진 모든 이미지파일 조회하기
	@Override
	public List<Files> selectUserFiles(String userId) {
		return fMapper.selectUserFiles(session,userId);
	}



	
	//조회수 up
	@Override
	public int viewCountUp(String writer) {
		// TODO Auto-generated method stub
		return memberMapper.updateViewCount(writer);
	}
	
	//조회수 가져오기
	@Override
	public int selectViewCount(String writer) {
		// TODO Auto-generated method stub
		return memberMapper.selectViewCount(writer);
	}
	

	
}
