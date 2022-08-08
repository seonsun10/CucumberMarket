package com.cu.cum.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.board.model.vo.Board;
@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectBoardList(SqlSessionTemplate session,Map page) {
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		
		
		return session.selectList("board.selectboardlist",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
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
	

}
