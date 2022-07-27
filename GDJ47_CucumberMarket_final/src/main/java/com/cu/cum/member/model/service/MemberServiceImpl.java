package com.cu.cum.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.member.model.dao.MemberDao;
import com.cu.cum.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Override
	public Member insertAdmin(Member m) {
		// TODO Auto-generated method stub
		return dao.save(m);
	}
	
}
