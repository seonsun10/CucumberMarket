package com.cu.cum.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.cu.cum.board.model.vo.Board;

public interface BoardDao {
	List<Board> selectBoardList(SqlSessionTemplate session);
}
