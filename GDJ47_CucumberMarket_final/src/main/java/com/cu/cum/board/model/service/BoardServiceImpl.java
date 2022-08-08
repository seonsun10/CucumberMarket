package com.cu.cum.board.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Board> selectBoardList(Map page) {
		// TODO Auto-generated method stub
		return dao.selectBoardList(session,page);
	}
	@Override
	public int insertBoard(Board b) {
		return dao.insertBoard(session,b);
	}
	@Override
	public Board selectBoard(int boardId) {
		return dao.selectBoard(session,boardId);
	}
	@Override
	public int selectboardCount() {
		// TODO Auto-generated method stub
		return dao.selectboardCount(session);
	}
	

}
