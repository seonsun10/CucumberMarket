package com.cu.cum.board.model.service;

import java.util.List;
import java.util.Map;

import com.cu.cum.board.model.vo.Board;
import com.cu.cum.board.model.vo.RecommendList;

public interface BoardService {
	List<Board> selectBoardList(Map page);
	List<Board> selectBoardList2(Map page);
	int insertBoard(Board b);
	Board selectBoard(int boardId);
	int selectboardCount();
	
	int selectboardCount2();
	
	int recommendCheck(RecommendList r);
	int recommendboard(RecommendList r);
	
	int recommendIdcount(int boardId);
	int updateBoard(Board b);
}
