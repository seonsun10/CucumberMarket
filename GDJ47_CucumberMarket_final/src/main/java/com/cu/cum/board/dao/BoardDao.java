package com.cu.cum.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.cu.cum.board.model.vo.Board;
import com.cu.cum.board.model.vo.RecommendList;

public interface BoardDao {
	List<Board> selectBoardList(SqlSessionTemplate session,Map page);
	List<Board> selectBoardList2(SqlSessionTemplate session,Map page);
	int insertBoard(SqlSessionTemplate session,Board b);
	Board selectBoard(SqlSessionTemplate session,int BoardId);
	int selectboardCount(SqlSessionTemplate session);
	int selectboardCount2(SqlSessionTemplate session);
	int recommendCheck(SqlSessionTemplate session,RecommendList r);
	int recommendboard(SqlSessionTemplate session,RecommendList r);
	int recommendIdcount(SqlSessionTemplate session,int BoardId);
	int updateBoard(SqlSessionTemplate session,Board b);
}
