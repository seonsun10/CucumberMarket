package com.cu.cum.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.board.dao.BoardDao;
import com.cu.cum.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Board> selectBoardList() {
		// TODO Auto-generated method stub
		return dao.selectBoardList(session);
	}

}
