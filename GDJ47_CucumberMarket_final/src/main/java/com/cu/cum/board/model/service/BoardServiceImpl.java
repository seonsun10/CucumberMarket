package com.cu.cum.board.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.board.dao.BoardDao;
import com.cu.cum.board.model.vo.Board;
import com.cu.cum.board.model.vo.RecommendList;

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
	public List<Board> selectBoardList2(Map page) {
		// TODO Auto-generated method stub
		return dao.selectBoardList2(session,page);
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
	
	@Override
	public int selectboardCount2() {
		// TODO Auto-generated method stub
		return dao.selectboardCount2(session);
	}
	@Override
	public int recommendCheck(RecommendList r) {
		// TODO Auto-generated method stub
		return dao.recommendCheck(session,r);
	}
	@Override
	public int recommendboard(RecommendList r) {
		// TODO Auto-generated method stub
		return dao.recommendboard(session,r);
	}
	@Override
	public int recommendIdcount(int boardId) {
		// TODO Auto-generated method stub
		return dao.recommendIdcount(session,boardId);
	}
	@Override
	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return dao.updateBoard(session,b);
	}
	
	

}
