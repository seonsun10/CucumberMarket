package com.cu.cum.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.board.model.vo.Board;
import com.cu.cum.board.model.vo.RecommendList;
@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectBoardList(SqlSessionTemplate session,Map page) {
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		
		
		return session.selectList("board.selectboardlist",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	@Override
	public List<Board> selectBoardList2(SqlSessionTemplate session,Map page) {
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		String category = (String)page.get("categoryname");
		
		return session.selectList("board.selectboardlist2",category,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	@Override
	public int insertBoard(SqlSessionTemplate session,Board b) {
		return session.insert("board.insertboard", b);
	}
	@Override
	public Board selectBoard(SqlSessionTemplate session,int boardId) {
		return session.selectOne("board.selectboard",boardId);
	}
	@Override
	public int selectboardCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectboardcount");
	}
	
	@Override
	public int selectboardCount2(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectboardcount2");
	}
	@Override
	public int recommendCheck(SqlSessionTemplate session, RecommendList r) {
		// TODO Auto-generated method stub
		return session.selectOne("board.recommendcheck",r);
	}
	@Override
	public int recommendboard(SqlSessionTemplate session, RecommendList r) {
		// TODO Auto-generated method stub
		return session.insert("board.recommendboard",r);
	}
	@Override
	public int recommendIdcount(SqlSessionTemplate session, int BoardId) {
		// TODO Auto-generated method stub
		return session.selectOne("board.recommendidcount",BoardId);
	}
	@Override
	public int updateBoard(SqlSessionTemplate session, Board b) {
		// TODO Auto-generated method stub
		return session.update("board.updateboard",b);
	}
	
	

}
