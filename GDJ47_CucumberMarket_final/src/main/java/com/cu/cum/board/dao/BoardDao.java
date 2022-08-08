package com.cu.cum.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.cu.cum.board.model.vo.Board;

public interface BoardDao {
	List<Board> selectBoardList(SqlSessionTemplate session,Map page);
	int insertBoard(SqlSessionTemplate session,Board b);
	Board selectBoard(SqlSessionTemplate session,int BoardId);
	int selectboardCount(SqlSessionTemplate session);
}
